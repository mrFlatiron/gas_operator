#ifndef EIGENVALS_PLOT_MODEL_H
#define EIGENVALS_PLOT_MODEL_H

#include "abstract_plot_model.h"

class eigenvals_plot_model : public abstract_plot_model
{
private:
  std::vector<std::complex<double>> m_eigenvalues;
public:
  eigenvals_plot_model ();
  ~eigenvals_plot_model ();

  virtual int graphs_count () const {return 1;}

  virtual QPointF point_by_x (const int, const double) const {return QPointF ();}

  virtual QPointF point_by_num (const int, const int point_num) const {return QPointF (m_eigenvalues[point_num].real (),
                                                                                       m_eigenvalues[point_num].imag ());}

  virtual QVariant paint_config (const int graph_num, const graph_role role) const;

  virtual void bounds (const int, double &left, double &right) const;

  void set_eigenvalues (const std::vector<std::complex<double>> &evalues);
};

#endif // EIGENVALS_PLOT_MODEL_H
