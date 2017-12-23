#include "precompiled/precompiled_header.h"
#include "eigenvals_plot_model.h"
#include <QColor>

eigenvals_plot_model::eigenvals_plot_model ()
{

}

eigenvals_plot_model::~eigenvals_plot_model ()
{

}

QVariant eigenvals_plot_model::paint_config (const int, const graph_role role) const
{
  switch (role)
    {
    case graph_role::discrete:
      return true;
    case graph_role::color:
      return QColor (Qt::red);
    case graph_role::points_count:
      return isize (m_eigenvalues);
    case graph_role::shown:
      return true;
    case graph_role::connect_points:
      return false;
    case graph_role::width:
      return 2;
    default:
      return QVariant ();
    }

  return QVariant ();
}

void eigenvals_plot_model::bounds (const int, double &left, double &right) const
{
  left = -1;
  right = 1;

  if (isize (m_eigenvalues) > 0)
    {
      left = m_eigenvalues[0].real ();
      right = left;
    }

  for (auto v : m_eigenvalues)
    {
      if (v.real () < left)
        left = v.real ();

      if (v.real () > right)
        right = v.real ();
    }
}

void eigenvals_plot_model::set_eigenvalues (const std::vector<std::complex<double> > &evalues)
{
//  m_eigenvalues = evalues;
  m_eigenvalues.clear ();
  int count = 0;
 for (auto e : evalues)
   {
     if (e.real () < 0)
       count++;
     else
       m_eigenvalues.push_back (e);
   }

 printf ("%d / %d have negative real part\n", count, isize (evalues));

  model_changed ();
}
