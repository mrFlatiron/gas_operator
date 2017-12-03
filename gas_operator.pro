TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += src/common/math_utils.cpp \
    src/main/main.cpp \
    src/kernel/scheme_operator.cpp

HEADERS += \
    src/common/debug_utils.h \
    src/common/math_utils.h \
    src/common/utils.h \
    src/precompiled/precompiled_header.h \
    src/kernel/scheme_operator.h \
    src/3rd_party/Eigen/src/Cholesky/LDLT.h \
    src/3rd_party/Eigen/src/Cholesky/LLT.h \
    src/3rd_party/Eigen/src/Cholesky/LLT_LAPACKE.h \
    src/3rd_party/Eigen/src/CholmodSupport/CholmodSupport.h \
    src/3rd_party/Eigen/src/Core/arch/AltiVec/Complex.h \
    src/3rd_party/Eigen/src/Core/arch/AltiVec/MathFunctions.h \
    src/3rd_party/Eigen/src/Core/arch/AltiVec/PacketMath.h \
    src/3rd_party/Eigen/src/Core/arch/AVX/Complex.h \
    src/3rd_party/Eigen/src/Core/arch/AVX/MathFunctions.h \
    src/3rd_party/Eigen/src/Core/arch/AVX/PacketMath.h \
    src/3rd_party/Eigen/src/Core/arch/AVX/TypeCasting.h \
    src/3rd_party/Eigen/src/Core/arch/AVX512/MathFunctions.h \
    src/3rd_party/Eigen/src/Core/arch/AVX512/PacketMath.h \
    src/3rd_party/Eigen/src/Core/arch/CUDA/Complex.h \
    src/3rd_party/Eigen/src/Core/arch/CUDA/Half.h \
    src/3rd_party/Eigen/src/Core/arch/CUDA/MathFunctions.h \
    src/3rd_party/Eigen/src/Core/arch/CUDA/PacketMath.h \
    src/3rd_party/Eigen/src/Core/arch/CUDA/PacketMathHalf.h \
    src/3rd_party/Eigen/src/Core/arch/CUDA/TypeCasting.h \
    src/3rd_party/Eigen/src/Core/arch/Default/Settings.h \
    src/3rd_party/Eigen/src/Core/arch/NEON/Complex.h \
    src/3rd_party/Eigen/src/Core/arch/NEON/MathFunctions.h \
    src/3rd_party/Eigen/src/Core/arch/NEON/PacketMath.h \
    src/3rd_party/Eigen/src/Core/arch/SSE/Complex.h \
    src/3rd_party/Eigen/src/Core/arch/SSE/MathFunctions.h \
    src/3rd_party/Eigen/src/Core/arch/SSE/PacketMath.h \
    src/3rd_party/Eigen/src/Core/arch/SSE/TypeCasting.h \
    src/3rd_party/Eigen/src/Core/arch/ZVector/Complex.h \
    src/3rd_party/Eigen/src/Core/arch/ZVector/MathFunctions.h \
    src/3rd_party/Eigen/src/Core/arch/ZVector/PacketMath.h \
    src/3rd_party/Eigen/src/Core/functors/AssignmentFunctors.h \
    src/3rd_party/Eigen/src/Core/functors/BinaryFunctors.h \
    src/3rd_party/Eigen/src/Core/functors/NullaryFunctors.h \
    src/3rd_party/Eigen/src/Core/functors/StlFunctors.h \
    src/3rd_party/Eigen/src/Core/functors/TernaryFunctors.h \
    src/3rd_party/Eigen/src/Core/functors/UnaryFunctors.h \
    src/3rd_party/Eigen/src/Core/products/GeneralBlockPanelKernel.h \
    src/3rd_party/Eigen/src/Core/products/GeneralMatrixMatrix.h \
    src/3rd_party/Eigen/src/Core/products/GeneralMatrixMatrix_BLAS.h \
    src/3rd_party/Eigen/src/Core/products/GeneralMatrixMatrixTriangular.h \
    src/3rd_party/Eigen/src/Core/products/GeneralMatrixMatrixTriangular_BLAS.h \
    src/3rd_party/Eigen/src/Core/products/GeneralMatrixVector.h \
    src/3rd_party/Eigen/src/Core/products/GeneralMatrixVector_BLAS.h \
    src/3rd_party/Eigen/src/Core/products/Parallelizer.h \
    src/3rd_party/Eigen/src/Core/products/SelfadjointMatrixMatrix.h \
    src/3rd_party/Eigen/src/Core/products/SelfadjointMatrixMatrix_BLAS.h \
    src/3rd_party/Eigen/src/Core/products/SelfadjointMatrixVector.h \
    src/3rd_party/Eigen/src/Core/products/SelfadjointMatrixVector_BLAS.h \
    src/3rd_party/Eigen/src/Core/products/SelfadjointProduct.h \
    src/3rd_party/Eigen/src/Core/products/SelfadjointRank2Update.h \
    src/3rd_party/Eigen/src/Core/products/TriangularMatrixMatrix.h \
    src/3rd_party/Eigen/src/Core/products/TriangularMatrixMatrix_BLAS.h \
    src/3rd_party/Eigen/src/Core/products/TriangularMatrixVector.h \
    src/3rd_party/Eigen/src/Core/products/TriangularMatrixVector_BLAS.h \
    src/3rd_party/Eigen/src/Core/products/TriangularSolverMatrix.h \
    src/3rd_party/Eigen/src/Core/products/TriangularSolverMatrix_BLAS.h \
    src/3rd_party/Eigen/src/Core/products/TriangularSolverVector.h \
    src/3rd_party/Eigen/src/Core/util/BlasUtil.h \
    src/3rd_party/Eigen/src/Core/util/Constants.h \
    src/3rd_party/Eigen/src/Core/util/DisableStupidWarnings.h \
    src/3rd_party/Eigen/src/Core/util/ForwardDeclarations.h \
    src/3rd_party/Eigen/src/Core/util/Macros.h \
    src/3rd_party/Eigen/src/Core/util/Memory.h \
    src/3rd_party/Eigen/src/Core/util/Meta.h \
    src/3rd_party/Eigen/src/Core/util/MKL_support.h \
    src/3rd_party/Eigen/src/Core/util/NonMPL2.h \
    src/3rd_party/Eigen/src/Core/util/ReenableStupidWarnings.h \
    src/3rd_party/Eigen/src/Core/util/StaticAssert.h \
    src/3rd_party/Eigen/src/Core/util/XprHelper.h \
    src/3rd_party/Eigen/src/Core/Array.h \
    src/3rd_party/Eigen/src/Core/ArrayBase.h \
    src/3rd_party/Eigen/src/Core/ArrayWrapper.h \
    src/3rd_party/Eigen/src/Core/Assign.h \
    src/3rd_party/Eigen/src/Core/Assign_MKL.h \
    src/3rd_party/Eigen/src/Core/AssignEvaluator.h \
    src/3rd_party/Eigen/src/Core/BandMatrix.h \
    src/3rd_party/Eigen/src/Core/Block.h \
    src/3rd_party/Eigen/src/Core/BooleanRedux.h \
    src/3rd_party/Eigen/src/Core/CommaInitializer.h \
    src/3rd_party/Eigen/src/Core/ConditionEstimator.h \
    src/3rd_party/Eigen/src/Core/CoreEvaluators.h \
    src/3rd_party/Eigen/src/Core/CoreIterators.h \
    src/3rd_party/Eigen/src/Core/CwiseBinaryOp.h \
    src/3rd_party/Eigen/src/Core/CwiseNullaryOp.h \
    src/3rd_party/Eigen/src/Core/CwiseTernaryOp.h \
    src/3rd_party/Eigen/src/Core/CwiseUnaryOp.h \
    src/3rd_party/Eigen/src/Core/CwiseUnaryView.h \
    src/3rd_party/Eigen/src/Core/DenseBase.h \
    src/3rd_party/Eigen/src/Core/DenseCoeffsBase.h \
    src/3rd_party/Eigen/src/Core/DenseStorage.h \
    src/3rd_party/Eigen/src/Core/Diagonal.h \
    src/3rd_party/Eigen/src/Core/DiagonalMatrix.h \
    src/3rd_party/Eigen/src/Core/DiagonalProduct.h \
    src/3rd_party/Eigen/src/Core/Dot.h \
    src/3rd_party/Eigen/src/Core/EigenBase.h \
    src/3rd_party/Eigen/src/Core/ForceAlignedAccess.h \
    src/3rd_party/Eigen/src/Core/Fuzzy.h \
    src/3rd_party/Eigen/src/Core/GeneralProduct.h \
    src/3rd_party/Eigen/src/Core/GenericPacketMath.h \
    src/3rd_party/Eigen/src/Core/GlobalFunctions.h \
    src/3rd_party/Eigen/src/Core/Inverse.h \
    src/3rd_party/Eigen/src/Core/IO.h \
    src/3rd_party/Eigen/src/Core/Map.h \
    src/3rd_party/Eigen/src/Core/MapBase.h \
    src/3rd_party/Eigen/src/Core/MathFunctions.h \
    src/3rd_party/Eigen/src/Core/MathFunctionsImpl.h \
    src/3rd_party/Eigen/src/Core/Matrix.h \
    src/3rd_party/Eigen/src/Core/MatrixBase.h \
    src/3rd_party/Eigen/src/Core/NestByValue.h \
    src/3rd_party/Eigen/src/Core/NoAlias.h \
    src/3rd_party/Eigen/src/Core/NumTraits.h \
    src/3rd_party/Eigen/src/Core/PermutationMatrix.h \
    src/3rd_party/Eigen/src/Core/PlainObjectBase.h \
    src/3rd_party/Eigen/src/Core/Product.h \
    src/3rd_party/Eigen/src/Core/ProductEvaluators.h \
    src/3rd_party/Eigen/src/Core/Random.h \
    src/3rd_party/Eigen/src/Core/Redux.h \
    src/3rd_party/Eigen/src/Core/Ref.h \
    src/3rd_party/Eigen/src/Core/Replicate.h \
    src/3rd_party/Eigen/src/Core/ReturnByValue.h \
    src/3rd_party/Eigen/src/Core/Reverse.h \
    src/3rd_party/Eigen/src/Core/Select.h \
    src/3rd_party/Eigen/src/Core/SelfAdjointView.h \
    src/3rd_party/Eigen/src/Core/SelfCwiseBinaryOp.h \
    src/3rd_party/Eigen/src/Core/Solve.h \
    src/3rd_party/Eigen/src/Core/SolverBase.h \
    src/3rd_party/Eigen/src/Core/SolveTriangular.h \
    src/3rd_party/Eigen/src/Core/StableNorm.h \
    src/3rd_party/Eigen/src/Core/Stride.h \
    src/3rd_party/Eigen/src/Core/Swap.h \
    src/3rd_party/Eigen/src/Core/Transpose.h \
    src/3rd_party/Eigen/src/Core/Transpositions.h \
    src/3rd_party/Eigen/src/Core/TriangularMatrix.h \
    src/3rd_party/Eigen/src/Core/VectorBlock.h \
    src/3rd_party/Eigen/src/Core/VectorwiseOp.h \
    src/3rd_party/Eigen/src/Core/Visitor.h \
    src/3rd_party/Eigen/src/Eigenvalues/ComplexEigenSolver.h \
    src/3rd_party/Eigen/src/Eigenvalues/ComplexSchur.h \
    src/3rd_party/Eigen/src/Eigenvalues/ComplexSchur_LAPACKE.h \
    src/3rd_party/Eigen/src/Eigenvalues/EigenSolver.h \
    src/3rd_party/Eigen/src/Eigenvalues/GeneralizedEigenSolver.h \
    src/3rd_party/Eigen/src/Eigenvalues/GeneralizedSelfAdjointEigenSolver.h \
    src/3rd_party/Eigen/src/Eigenvalues/HessenbergDecomposition.h \
    src/3rd_party/Eigen/src/Eigenvalues/MatrixBaseEigenvalues.h \
    src/3rd_party/Eigen/src/Eigenvalues/RealQZ.h \
    src/3rd_party/Eigen/src/Eigenvalues/RealSchur.h \
    src/3rd_party/Eigen/src/Eigenvalues/RealSchur_LAPACKE.h \
    src/3rd_party/Eigen/src/Eigenvalues/SelfAdjointEigenSolver.h \
    src/3rd_party/Eigen/src/Eigenvalues/SelfAdjointEigenSolver_LAPACKE.h \
    src/3rd_party/Eigen/src/Eigenvalues/Tridiagonalization.h \
    src/3rd_party/Eigen/src/Geometry/arch/Geometry_SSE.h \
    src/3rd_party/Eigen/src/Geometry/AlignedBox.h \
    src/3rd_party/Eigen/src/Geometry/AngleAxis.h \
    src/3rd_party/Eigen/src/Geometry/EulerAngles.h \
    src/3rd_party/Eigen/src/Geometry/Homogeneous.h \
    src/3rd_party/Eigen/src/Geometry/Hyperplane.h \
    src/3rd_party/Eigen/src/Geometry/OrthoMethods.h \
    src/3rd_party/Eigen/src/Geometry/ParametrizedLine.h \
    src/3rd_party/Eigen/src/Geometry/Quaternion.h \
    src/3rd_party/Eigen/src/Geometry/Rotation2D.h \
    src/3rd_party/Eigen/src/Geometry/RotationBase.h \
    src/3rd_party/Eigen/src/Geometry/Scaling.h \
    src/3rd_party/Eigen/src/Geometry/Transform.h \
    src/3rd_party/Eigen/src/Geometry/Translation.h \
    src/3rd_party/Eigen/src/Geometry/Umeyama.h \
    src/3rd_party/Eigen/src/Householder/BlockHouseholder.h \
    src/3rd_party/Eigen/src/Householder/Householder.h \
    src/3rd_party/Eigen/src/Householder/HouseholderSequence.h \
    src/3rd_party/Eigen/src/IterativeLinearSolvers/BasicPreconditioners.h \
    src/3rd_party/Eigen/src/IterativeLinearSolvers/BiCGSTAB.h \
    src/3rd_party/Eigen/src/IterativeLinearSolvers/ConjugateGradient.h \
    src/3rd_party/Eigen/src/IterativeLinearSolvers/IncompleteCholesky.h \
    src/3rd_party/Eigen/src/IterativeLinearSolvers/IncompleteLUT.h \
    src/3rd_party/Eigen/src/IterativeLinearSolvers/IterativeSolverBase.h \
    src/3rd_party/Eigen/src/IterativeLinearSolvers/LeastSquareConjugateGradient.h \
    src/3rd_party/Eigen/src/IterativeLinearSolvers/SolveWithGuess.h \
    src/3rd_party/Eigen/src/Jacobi/Jacobi.h \
    src/3rd_party/Eigen/src/LU/arch/Inverse_SSE.h \
    src/3rd_party/Eigen/src/LU/Determinant.h \
    src/3rd_party/Eigen/src/LU/FullPivLU.h \
    src/3rd_party/Eigen/src/LU/InverseImpl.h \
    src/3rd_party/Eigen/src/LU/PartialPivLU.h \
    src/3rd_party/Eigen/src/LU/PartialPivLU_LAPACKE.h \
    src/3rd_party/Eigen/src/MetisSupport/MetisSupport.h \
    src/3rd_party/Eigen/src/misc/blas.h \
    src/3rd_party/Eigen/src/misc/Image.h \
    src/3rd_party/Eigen/src/misc/Kernel.h \
    src/3rd_party/Eigen/src/misc/lapack.h \
    src/3rd_party/Eigen/src/misc/lapacke.h \
    src/3rd_party/Eigen/src/misc/lapacke_mangling.h \
    src/3rd_party/Eigen/src/misc/RealSvd2x2.h \
    src/3rd_party/Eigen/src/OrderingMethods/Amd.h \
    src/3rd_party/Eigen/src/OrderingMethods/Eigen_Colamd.h \
    src/3rd_party/Eigen/src/OrderingMethods/Ordering.h \
    src/3rd_party/Eigen/src/PardisoSupport/PardisoSupport.h \
    src/3rd_party/Eigen/src/PaStiXSupport/PaStiXSupport.h \
    src/3rd_party/Eigen/src/plugins/ArrayCwiseBinaryOps.h \
    src/3rd_party/Eigen/src/plugins/ArrayCwiseUnaryOps.h \
    src/3rd_party/Eigen/src/plugins/BlockMethods.h \
    src/3rd_party/Eigen/src/plugins/CommonCwiseBinaryOps.h \
    src/3rd_party/Eigen/src/plugins/CommonCwiseUnaryOps.h \
    src/3rd_party/Eigen/src/plugins/MatrixCwiseBinaryOps.h \
    src/3rd_party/Eigen/src/plugins/MatrixCwiseUnaryOps.h \
    src/3rd_party/Eigen/src/QR/ColPivHouseholderQR.h \
    src/3rd_party/Eigen/src/QR/ColPivHouseholderQR_LAPACKE.h \
    src/3rd_party/Eigen/src/QR/CompleteOrthogonalDecomposition.h \
    src/3rd_party/Eigen/src/QR/FullPivHouseholderQR.h \
    src/3rd_party/Eigen/src/QR/HouseholderQR.h \
    src/3rd_party/Eigen/src/QR/HouseholderQR_LAPACKE.h \
    src/3rd_party/Eigen/src/SparseCholesky/SimplicialCholesky.h \
    src/3rd_party/Eigen/src/SparseCholesky/SimplicialCholesky_impl.h \
    src/3rd_party/Eigen/src/SparseCore/AmbiVector.h \
    src/3rd_party/Eigen/src/SparseCore/CompressedStorage.h \
    src/3rd_party/Eigen/src/SparseCore/ConservativeSparseSparseProduct.h \
    src/3rd_party/Eigen/src/SparseCore/MappedSparseMatrix.h \
    src/3rd_party/Eigen/src/SparseCore/SparseAssign.h \
    src/3rd_party/Eigen/src/SparseCore/SparseBlock.h \
    src/3rd_party/Eigen/src/SparseCore/SparseColEtree.h \
    src/3rd_party/Eigen/src/SparseCore/SparseCompressedBase.h \
    src/3rd_party/Eigen/src/SparseCore/SparseCwiseBinaryOp.h \
    src/3rd_party/Eigen/src/SparseCore/SparseCwiseUnaryOp.h \
    src/3rd_party/Eigen/src/SparseCore/SparseDenseProduct.h \
    src/3rd_party/Eigen/src/SparseCore/SparseDiagonalProduct.h \
    src/3rd_party/Eigen/src/SparseCore/SparseDot.h \
    src/3rd_party/Eigen/src/SparseCore/SparseFuzzy.h \
    src/3rd_party/Eigen/src/SparseCore/SparseMap.h \
    src/3rd_party/Eigen/src/SparseCore/SparseMatrix.h \
    src/3rd_party/Eigen/src/SparseCore/SparseMatrixBase.h \
    src/3rd_party/Eigen/src/SparseCore/SparsePermutation.h \
    src/3rd_party/Eigen/src/SparseCore/SparseProduct.h \
    src/3rd_party/Eigen/src/SparseCore/SparseRedux.h \
    src/3rd_party/Eigen/src/SparseCore/SparseRef.h \
    src/3rd_party/Eigen/src/SparseCore/SparseSelfAdjointView.h \
    src/3rd_party/Eigen/src/SparseCore/SparseSolverBase.h \
    src/3rd_party/Eigen/src/SparseCore/SparseSparseProductWithPruning.h \
    src/3rd_party/Eigen/src/SparseCore/SparseTranspose.h \
    src/3rd_party/Eigen/src/SparseCore/SparseTriangularView.h \
    src/3rd_party/Eigen/src/SparseCore/SparseUtil.h \
    src/3rd_party/Eigen/src/SparseCore/SparseVector.h \
    src/3rd_party/Eigen/src/SparseCore/SparseView.h \
    src/3rd_party/Eigen/src/SparseCore/TriangularSolver.h \
    src/3rd_party/Eigen/src/SparseLU/SparseLU.h \
    src/3rd_party/Eigen/src/SparseLU/SparseLU_column_bmod.h \
    src/3rd_party/Eigen/src/SparseLU/SparseLU_column_dfs.h \
    src/3rd_party/Eigen/src/SparseLU/SparseLU_copy_to_ucol.h \
    src/3rd_party/Eigen/src/SparseLU/SparseLU_gemm_kernel.h \
    src/3rd_party/Eigen/src/SparseLU/SparseLU_heap_relax_snode.h \
    src/3rd_party/Eigen/src/SparseLU/SparseLU_kernel_bmod.h \
    src/3rd_party/Eigen/src/SparseLU/SparseLU_Memory.h \
    src/3rd_party/Eigen/src/SparseLU/SparseLU_panel_bmod.h \
    src/3rd_party/Eigen/src/SparseLU/SparseLU_panel_dfs.h \
    src/3rd_party/Eigen/src/SparseLU/SparseLU_pivotL.h \
    src/3rd_party/Eigen/src/SparseLU/SparseLU_pruneL.h \
    src/3rd_party/Eigen/src/SparseLU/SparseLU_relax_snode.h \
    src/3rd_party/Eigen/src/SparseLU/SparseLU_Structs.h \
    src/3rd_party/Eigen/src/SparseLU/SparseLU_SupernodalMatrix.h \
    src/3rd_party/Eigen/src/SparseLU/SparseLU_Utils.h \
    src/3rd_party/Eigen/src/SparseLU/SparseLUImpl.h \
    src/3rd_party/Eigen/src/SparseQR/SparseQR.h \
    src/3rd_party/Eigen/src/SPQRSupport/SuiteSparseQRSupport.h \
    src/3rd_party/Eigen/src/StlSupport/details.h \
    src/3rd_party/Eigen/src/StlSupport/StdDeque.h \
    src/3rd_party/Eigen/src/StlSupport/StdList.h \
    src/3rd_party/Eigen/src/StlSupport/StdVector.h \
    src/3rd_party/Eigen/src/SuperLUSupport/SuperLUSupport.h \
    src/3rd_party/Eigen/src/SVD/BDCSVD.h \
    src/3rd_party/Eigen/src/SVD/JacobiSVD.h \
    src/3rd_party/Eigen/src/SVD/JacobiSVD_LAPACKE.h \
    src/3rd_party/Eigen/src/SVD/SVDBase.h \
    src/3rd_party/Eigen/src/SVD/UpperBidiagonalization.h \
    src/3rd_party/Eigen/src/UmfPackSupport/UmfPackSupport.h \
    src/3rd_party/Eigen/Cholesky \
    src/3rd_party/Eigen/CholmodSupport \
    src/3rd_party/Eigen/Core \
    src/3rd_party/Eigen/Dense \
    src/3rd_party/Eigen/Eigen \
    src/3rd_party/Eigen/Eigenvalues \
    src/3rd_party/Eigen/Geometry \
    src/3rd_party/Eigen/Householder \
    src/3rd_party/Eigen/IterativeLinearSolvers \
    src/3rd_party/Eigen/Jacobi \
    src/3rd_party/Eigen/LU \
    src/3rd_party/Eigen/MetisSupport \
    src/3rd_party/Eigen/OrderingMethods \
    src/3rd_party/Eigen/PardisoSupport \
    src/3rd_party/Eigen/PaStiXSupport \
    src/3rd_party/Eigen/QR \
    src/3rd_party/Eigen/QtAlignedMalloc \
    src/3rd_party/Eigen/Sparse \
    src/3rd_party/Eigen/SparseCholesky \
    src/3rd_party/Eigen/SparseCore \
    src/3rd_party/Eigen/SparseLU \
    src/3rd_party/Eigen/SparseQR \
    src/3rd_party/Eigen/SPQRSupport \
    src/3rd_party/Eigen/StdDeque \
    src/3rd_party/Eigen/StdList \
    src/3rd_party/Eigen/StdVector \
    src/3rd_party/Eigen/SuperLUSupport \
    src/3rd_party/Eigen/SVD \
    src/3rd_party/Eigen/UmfPackSupport

INCLUDEPATH += src
