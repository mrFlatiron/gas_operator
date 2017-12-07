#include "graph_painter.h"
#include "abstract_plot_model.h"

graph_painter::graph_painter () : QPainter ()
{

}

graph_painter::graph_painter (QPaintDevice *device) : QPainter (device)
{

}

void graph_painter::draw_axis ()
{
  int d_width = device ()->width ();
  int d_height = device ()->height ();


  QPoint o (m_oy_shift, d_height - m_ox_shift);
  QPoint x (d_width, d_height - m_ox_shift);
  QPoint y (m_oy_shift, 0);

  drawLine (o, x);
  drawLine (o, y);

  QPen save_pen = pen ();
  QPen temp_pen;
  temp_pen.setStyle (Qt::DashLine);
  temp_pen.setCosmetic (true);
  temp_pen.setWidth (1);
  temp_pen.setColor (Qt::gray);

  setPen (temp_pen);
  drawLine (m_oy_shift, to_scale (QPointF (0, 0)).y (), d_width, to_scale (QPointF (0, 0)). y ());
  setPen (save_pen);


  draw_text_x ();
  draw_text_y ();


  QPointF max_val_text_point = to_scale (QPointF (m_x_max, m_y_max));
  max_val_text_point.setX (max_val_text_point.x () - 120);

  drawText (max_val_text_point, QString ("max:%1") .arg (QString::number (m_max_abs_val, 'e', 2)));

}

void graph_painter::draw_graph (const int graph_num)
{
  if (!m_plot_model->paint_config (graph_num, graph_role::shown).toBool ())
    return;

  QPen pen = set_pen (graph_num);
  setPen (pen);

  bool discrete = m_plot_model->paint_config (graph_num, graph_role::discrete).toBool ();
  bool connect_points = (discrete) ? m_plot_model->paint_config (graph_num, graph_role::connect_points).toBool () : true;

  QPointF first, second;

  first = get_first_graph_point (graph_num, discrete);

  if (connect_points && m_plot_model->paint_config (graph_num, graph_role::points_count) < 1)
    return;

  if (!connect_points)
    draw_cross_point (first);

  bool end = false;
  int i = 0;
  while (!end)
    {
      second = get_next_graph_point (graph_num, discrete, i, end);
      if (connect_points)
        draw_line (first, second);
      else
        draw_cross_point (second);
      first = second;
    }
}

void graph_painter::redraw_all ()
{
    calculate_plot_params ();
    draw_axis ();

  int graphs_count = m_plot_model->graphs_count ();
  for (int i = 0; i < graphs_count; i++)
    {
      draw_graph (i);
    }
}

void graph_painter::set_model (abstract_plot_model *model)
{
  m_plot_model = model;

}


graph_painter::~graph_painter ()
{

}

QPointF graph_painter::get_first_graph_point (const int graph_num, const bool discrete) const
{
  double a, b;
  m_plot_model->bounds (graph_num, a, b);
  if (discrete)
    return m_plot_model->point_by_num (graph_num, 0);
  else
    return m_plot_model->point_by_x (graph_num, a);
}

QPointF graph_painter::get_next_graph_point (const int graph_num, const bool discrete, int &inout, bool &end) const
{
  double a, b;
  m_plot_model->bounds (graph_num, a, b);
  inout++;
  if (discrete)
    {
      if (inout < m_plot_model->paint_config (graph_num, graph_role::points_count).toInt () - 1)
        {
          end = false;
          return m_plot_model->point_by_num (graph_num, inout);
        }
        else
        {
          end = true;
          return m_plot_model->point_by_num (graph_num, inout);
        }
    }
  else
    {
      double hx = (b - a) / (m_pivot_count - 1);
      double x = a + inout * hx;
      if (x < b)
        {
          end = false;
          return m_plot_model->point_by_x (graph_num, x);
        }
      else
        {
          end = true;
          return m_plot_model->point_by_x (graph_num, b);
        }
    }
}

void graph_painter::calculate_pivot_count ()
{
  m_pivot_count = device()->width () / 100 * m_smooth;
}

void graph_painter::calculate_plot_params ()
{
  int graphs_count = m_plot_model->graphs_count ();
  bool first = true;
  for (int i = 0; i < graphs_count; i++)
    {
      if (!m_plot_model->paint_config (i, graph_role::shown).toBool ())
          continue;

      double a, b;
      m_plot_model->bounds (i, a, b);
      if (first)
        {
          m_x_min = a;
          m_x_max = b;
        }
      else
        {
          if (a < m_x_min)
            m_x_min = a;
          if (b > m_x_max)
            m_x_max = b;
        }

      calculate_graph_vert_bounds (i, a, b);
      if (first)
        {
          m_y_min = a;
          m_y_max = b;
        }
      else
        {

          if (a < m_y_min)
            m_y_min = a;
          if (b > m_y_max)
            m_y_max = b;
        }
      first = false;
    }

  m_max_abs_val = (fabs (m_y_min) < fabs (m_y_max)) ? fabs (m_y_max) : fabs (m_y_min);

  double width = m_x_max - m_x_min;
  double height = m_y_max - m_y_min;


  int d_width = device ()->width ();
  int d_height = device ()->height ();

  int work_height = d_height  - 2 * m_graphs_shift - m_ox_shift;
  int work_width = d_width - 2 * m_graphs_shift - m_oy_shift;


  if (height < 1e-16)
  {
      if (fabs (m_y_max) < 1e-16)
        m_y_max = 1;
      else
        m_y_max = m_y_max + fabs (m_y_max) / 10;
      if (fabs (m_y_min) < 1e-16)
        m_y_min = -1;
      else
        m_y_min = m_y_min - fabs (m_y_min) / 10;
  }

  height = m_y_max - m_y_min;

  m_y_scale = (work_height) / (m_y_max - m_y_min);






  if (width > 1e-35)
    m_x_scale = (work_width) / (m_x_max - m_x_min);
  else
    m_x_scale = (work_width) / 1e-30;

}

void graph_painter::calculate_graph_vert_bounds (const int graph_num,
                                                 double &loc_min, double &loc_max)
{
  calculate_pivot_count ();

  bool is_discrete = m_plot_model->paint_config (graph_num, graph_role::discrete).toBool ();

  QPointF point;

  point = get_first_graph_point (graph_num, is_discrete);

  loc_min = point.y ();
  loc_max = point.y ();

  bool end = false;
  int i = 0;
  while (!end)
    {
      point = get_next_graph_point (graph_num, is_discrete, i, end);

      if (point.y () < loc_min)
        loc_min = point.y ();
      if (point.y () > loc_max)
        loc_max = point.y ();
    }
}

QPen graph_painter::set_pen (const int graph_num) const
{
  QPen pen;
  pen.setColor (m_plot_model->paint_config (graph_num, graph_role::color).value<QColor> ());
  pen.setWidth (m_plot_model->paint_config (graph_num, graph_role::width).toInt ());
  pen.setStyle (Qt::SolidLine);
  pen.setCapStyle (Qt::RoundCap);
  pen.setJoinStyle (Qt::RoundJoin);
  pen.setCosmetic (true);
  return pen;
}

QPointF graph_painter::to_scale (QPointF point)
{
  return QPointF ((point.x () - m_x_min) * m_x_scale + m_oy_shift + m_graphs_shift,
                  (point.y () - m_y_max) * -m_y_scale + m_graphs_shift);
}

void graph_painter::draw_line (QPointF point_a, QPointF point_b)
{
  drawLine (to_scale (point_a), to_scale (point_b));
}

void graph_painter::draw_text_x ()
{
  if (m_x_text_points < 2)
    m_x_text_points = 2;

  double h = (m_x_max - m_x_min) / (m_x_text_points - 1);

  for (int p = 0; p < m_x_text_points - 1; p++)
    {
      double x_val = m_x_min + h * p;
      draw_text_notch_x_local (x_val);
    }

  draw_text_notch_x_local (m_x_max);

}

void graph_painter::draw_text_y ()
{

  if (m_y_text_points < 2)
    m_y_text_points = 2;

  double h = (m_y_max - m_y_min) / (m_y_text_points - 1);

  for (int p = 0; p < m_y_text_points - 1; p++)
    {
      double y_val = m_y_min + h * p;
      draw_text_notch_y_local (y_val);
    }

  draw_text_notch_y_local (m_y_max);

}

void graph_painter::draw_text_notch_x_local (double x_val)
{
  int d_height = device ()->height ();
  QString text_str = QString::number (x_val, 'g', 3);
  double text_pos_x = to_scale (QPointF (x_val, 0)).x () - center_of_the_string_x (text_str);
  double text_pos_y = d_height - m_ox_shift + m_x_text_shift;
  drawText (text_pos_x, text_pos_y, text_str);

  drawLine (QPointF (to_scale (QPointF (x_val, 0)).x (), d_height - m_ox_shift),
            QPointF (to_scale (QPointF (x_val, 0)).x (), d_height - m_ox_shift - m_notch_length));
}

void graph_painter::draw_text_notch_y_local (double y_val)
{
  double y_notch_pos = to_scale (QPointF (0, y_val)).y ();
  double y_text_pos = y_notch_pos + center_of_the_string_y ();
  QString text = y_text_str (y_val);
  double x_text_pos = m_oy_shift - str_plot_length (text) - 10;

  drawText (x_text_pos, y_text_pos, text);

  drawLine (QPointF (m_oy_shift, y_notch_pos),
            QPointF (m_oy_shift + m_notch_length, y_notch_pos));
}

void graph_painter::draw_cross_point (QPointF point)
{
  double d = point_cross_half_length ();
  auto scaled = to_scale (point);
  drawLine (scaled, QPointF (scaled.x (), scaled.y () + d));
  drawLine (scaled, QPointF (scaled.x (), scaled.y () - d));
  drawLine (scaled, QPointF (scaled.x () + d, scaled.y ()));
  drawLine (scaled, QPointF (scaled.x () - d, scaled.y ()));
}

double graph_painter::char_length () const
{
  return 6;
}

double graph_painter::center_of_the_string_x (const QString &str) const
{
  int l = str.length ();
  double s1 = (l / 2) * char_length ();
  double s2 = (l % 2) ? char_length () / 2 : 0;

  return s1 + s2;
}

double graph_painter::center_of_the_string_y () const
{
  return 5;
}

double graph_painter::str_plot_length (const QString &str) const
{
  return char_length () * str.length ();
}

QString graph_painter::y_text_str (double y_val) const
{
  double abs_y_val = fabs (y_val);
  if (abs_y_val < 1e-5)
    return QString::number (y_val, 'e', 2);

  QString cand = QString::number (y_val, 'g', 3);
  if (cand.length () > 7)
    return QString::number (y_val, 'e', 2);

  return cand;
}

double graph_painter::point_cross_half_length () const
{
  return 2;
}
