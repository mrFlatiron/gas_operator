#include <iostream>
#include "src/kernel/scheme_operator.h"
#include "gui/main_window.h"
#include <QApplication>

int main(int argc, char *argv[])
{
  QApplication app (argc, argv);
//  scheme_operator op (10. / 40, 40, 10, 0.1);

//  auto evalues = op.compute_eigenvalues ();

//  for (auto v : evalues)
//    {
//      std::cout << v << std::endl;
//    }

  main_window w;

  w.exec ();

  return app.exec ();
}
