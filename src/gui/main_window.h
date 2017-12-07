#ifndef MAIN_WINDOW_H
#define MAIN_WINDOW_H
#include "precompiled/precompiled_header.h"

#include <QDialog>

class scheme_operator;
class graph_painter;
class eigenvals_plot_model;
class plot_widget;

class main_window : public QDialog
{
private:
  std::unique_ptr<scheme_operator> m_operator;
  std::unique_ptr<graph_painter> m_painter;
  std::unique_ptr<eigenvals_plot_model> m_model;
  plot_widget *m_plot = nullptr;

public:
  main_window ();
  ~main_window ();

  void create_widgets ();
  void set_layouts ();
  void make_connections ();
};

#endif // MAIN_WINDOW_H
