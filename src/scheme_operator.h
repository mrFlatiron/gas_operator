#ifndef SCHEME_OPERATOR_H
#define SCHEME_OPERATOR_H
#include "precompiled/precompiled_header.h"

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
 std::vector<double> m_operator;
 double m_h = 0;
 int m_M = 0;

 double m_mass = 0;
 double m_mu = 0.01;

 operator_status m_status = operator_status::empty;
public:
  scheme_operator ();

  scheme_operator (double h, int M, double mass, double mu);

  void reset (double h, int M, double mass, double mu);

  std::vector<double> compute_eigenvalues ();

private:
  void make_operator ();

  std::vector<double> compute_eigenvalues_private ();
};

#endif // SCHEME_OPERATOR_H
