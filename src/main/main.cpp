#include <iostream>
#include "src/kernel/scheme_operator.h"

int main(int argc, char *argv[])
{
  scheme_operator op (0.1, 100, 2, 0.1);

  auto evalues = op.compute_eigenvalues ();

  for (auto v : evalues)
    {
      std::cout << std::arg (v) << "\t" << std::norm (v) << std::endl;
    }

  return 0;
}
