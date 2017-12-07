#include "main_window.h"

#include "kernel/scheme_operator.h"
#include "gui/plot/graph_painter.h"
#include "gui/plot/eigenvals_plot_model.h"
#include "gui/plot/plot_widget.h"

#include <QVBoxLayout>

main_window::main_window ()
{
  create_widgets ();
  set_layouts ();
  make_connections ();
}

main_window::~main_window ()
{

}

void main_window::create_widgets ()
{
  m_operator = make_unique<scheme_operator> (10. / 400, 400, 10, 0.1);

  m_model = make_unique<eigenvals_plot_model> ();
  m_model->set_eigenvalues (m_operator->compute_eigenvalues ());

  m_painter = make_unique<graph_painter> ();
  m_painter->set_model (m_model.get ());

  m_plot = new plot_widget (m_painter.get (), this);

}

void main_window::set_layouts ()
{
  QVBoxLayout *vl0 = new QVBoxLayout;
  {
    vl0->addWidget (m_plot);
  }
  setLayout (vl0);
}

void main_window::make_connections ()
{

}
