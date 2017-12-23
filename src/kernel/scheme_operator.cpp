#include "scheme_operator.h"
#include "3rd_party/Eigen/Eigen"

scheme_operator::scheme_operator ()
{

}

scheme_operator::scheme_operator (double h, int M, double mass, double mu)
{
  reset (h, M, mass, mu);
}

void scheme_operator::reset (double h, int M, double mass, double mu)
{


  if (h <= 0 || mass <= 0 || mu <= 0)
    m_status = operator_status::failed;

  m_h = h;
  m_M = M;
  m_mass = mass;
  m_mu = mu;

  m_rho = mass / m_M;

  m_J.resize (M + 1);
  m_W.resize (M + 1);
  m_operator.resize (rows_count (), cols_count ());
  m_operator.setZero ();

  m_status = operator_status::ok;
}

std::vector<std::complex<double>> scheme_operator::compute_eigenvalues ()
{
  if (m_status != operator_status::ok)
    return {};

  make_operator ();

  dump ();

  return compute_eigenvalues_private ();
}

double scheme_operator::p_wave_deriv (double x)
{
  (void)x;
  return 1;
}

void scheme_operator::dump ()
{
  if (m_status != operator_status::ok)
    return;

  if (rows_count () > 10)
    return;

  for (int i = 0; i < rows_count (); i++)
    {
      for (int j = 0; j < cols_count (); j++)
        printf ("%lf ", m_operator (i, j));

      printf ("\n");
    }
}

void scheme_operator::make_operator ()
{
  int row = 0;
  int m = 0;

//  m = 1;
//  while (m <= m_M - 1)
//    {
//      set_W_coef (row, m + 1, 1 / m_h);
//      set_W_coef (row, m - 1, -1 / m_h);

//      row++;
//      m++;
//    }

//  m = 0;
//  set_W_coef (row, m + 2, -1 / m_h);
//  set_W_coef (row, m + 1, 4 / m_h);
//  set_W_coef (row, m, -3 / m_h);

//  row++;
//  m++;


//  m = m_M;
//  set_W_coef (row, m - 2, 1 / m_h);
//  set_W_coef (row, m - 1, -4 / m_h);
//  set_W_coef (row, m, 3 / m_h);

//  row++;

//  m = 1;
//  while (m <= m_M - 1)
//    {
//      set_J_coef (row, m +  1, p_wave_deriv (m_rho) / (2 * m_h));
//      set_J_coef (row, m - 1, -p_wave_deriv (m_rho) / (2 * m_h));
//      set_W_coef (row, m + 1, -m_mu / (m_rho * m_h * m_h));
//      set_W_coef (row, m, 2 * m_mu / (m_rho * m_h * m_h));
//      set_W_coef (row, m - 1, -m_mu / (m_rho * m_h * m_h));

//      row++;
//      m++;
//    }

//  set_W_coef (row, 0, 1);
//  row++;
//  set_W_coef (row, m_M, 1);

//  set_W_coef (row, 0, 1);
//  row++;

  if (m_M > 2)
    set_W_coef (row, 2, -1 / m_h);

  set_W_coef (row, 1, 4 / m_h);
//    set_W_coef (row, 0, -3 / m_h);
row++;
  m = 1;
  while (m <= m_M -1)
    {

      if (m != m_M - 1)
        set_W_coef (row, m + 1, 1 / m_h);
      set_W_coef (row, m - 1, -1 / m_h);

      row++;

      set_J_coef (row, m +  1, p_wave_deriv (m_rho) / (2 * m_h));
      set_J_coef (row, m - 1, -p_wave_deriv (m_rho) / (2 * m_h));
      if (m != m_M - 1)
        set_W_coef (row, m + 1, -m_mu / (m_rho * m_h * m_h));
      set_W_coef (row, m, 2 * m_mu / (m_rho * m_h * m_h));
      set_W_coef (row, m - 1, -m_mu / (m_rho * m_h * m_h));

      row++;




      m++;
    }

  set_W_coef (row, m_M - 2, 1 / m_h);
  set_W_coef (row, m_M - 1, -4 / m_h);
//  set_W_coef (row, m_M, 3 / m_h);

  row++;

//  set_W_coef (row, m_M, 1);
}

std::vector<std::complex<double>> scheme_operator::compute_eigenvalues_private ()
{
  using namespace Eigen;

  VectorXcd ev = m_operator.eigenvalues ();

  std::vector<std::complex<double>> retval (rows_count ());

  for (int i = 0; i < rows_count (); i++)
    retval[i] = ev (i);

  return retval;
}

int scheme_operator::pos (int i, int j) const
{
  auto val = i * (cols_count ()) + j;
  if (val >= (2 * m_M + 2) * (2 * m_M + 2))
    {
      DEBUG_PAUSE ("Out of range");
      return 0;
    }
  return val;
}

void scheme_operator::set_J_coef (int row, int m, double val)
{
  m_operator (row, col_for_J (m)) = val;
}

void scheme_operator::set_W_coef (int row, int m, double val)
{
  m_operator (row, col_for_W (m)) = val;
}

int scheme_operator::col_for_J (int m) const
{
//  return m;
  if (m < 2)
    return m;

  return 2 * m - 1;
}

int scheme_operator::col_for_W (int m) const
{
//  return m_M + m;
  return 2 * m;
}

double scheme_operator::g () const
{
  return log (m_rho);
}

int scheme_operator::rows_count () const
{
  return 2 * m_M /*+ 2*/;
}

int scheme_operator::cols_count () const
{
  return rows_count ();
}

int scheme_operator::matrix_size () const
{
  return rows_count () * cols_count ();
}
