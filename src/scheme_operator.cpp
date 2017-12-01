#include "scheme_operator.h"

scheme_operator::scheme_operator ()
{

}

scheme_operator::scheme_operator (double h, int M, double mass, double mu)
{
  reset (h, M, mass, mu);
}

void scheme_operator::reset (double h, int M, double mass, double mu)
{


  if (M < 3 || h <= 0 || mass <= 0 || mu <= 0)
    m_status = operator_status::failed;

  m_h = h;
  m_M = M;
  m_mass = mass;
  m_mu = mu;

  m_J.resize (M + 1);
  m_W.resize (M + 1);
  m_operator.resize ((M + 1) * (M + 1));

  m_status = operator_status::ok;
}

std::vector<double> scheme_operator::compute_eigenvalues ()
{
  if (m_status != operator_status::ok)
    return {};

  make_operator ();

  return compute_eigenvalues_private ();
}

void scheme_operator::make_operator ()
{

}

std::vector<double> scheme_operator::compute_eigenvalues_private ()
{
  return {};
}
