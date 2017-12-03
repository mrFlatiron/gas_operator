#ifndef SCHEME_OPERATOR_H
#define SCHEME_OPERATOR_H
#include "precompiled/precompiled_header.h"
#include "3rd_party/Eigen/Core"

enum class operator_status
{
  empty,
  failed,
  ok
};

class scheme_operator
{
private:
 std::vector<double> m_J;
 std::vector<double> m_W;
 Eigen::MatrixXd m_operator;
 double m_h = 0;
 int m_M = 0;

 double m_mass = 0;
 double m_rho = 0;
 double m_mu = 0.01;

 operator_status m_status = operator_status::empty;
public:
  scheme_operator ();

  scheme_operator (double h, int M, double mass, double mu);

  void reset (double h, int M, double mass, double mu);

  std::vector<std::complex<double>> compute_eigenvalues ();

  static double p_wave_deriv (double x);

  void dump ();

  int rows_count () const;
  int cols_count () const;
  int matrix_size () const;
private:
  void make_operator ();

  std::vector<std::complex<double>> compute_eigenvalues_private ();

  int pos (int i, int j) const;
  void set_J_coef (int row, int m, double val);
  void set_W_coef (int row, int m, double val);

  int col_for_J (int m) const;
  int col_for_W (int m) const;

  double g () const;


};

#endif // SCHEME_OPERATOR_H
