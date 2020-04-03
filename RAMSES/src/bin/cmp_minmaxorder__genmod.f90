        !COMPILER-GENERATED INTERFACE MODULE: Mon Sep  9 11:20:27 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE CMP_MINMAXORDER__genmod
          INTERFACE 
            SUBROUTINE CMP_MINMAXORDER(X,ORDER_MIN,ORDER_MAX,DX,NN)
              REAL(KIND=8) :: X(1:32,1:3)
              REAL(KIND=8) :: ORDER_MIN(1:32)
              REAL(KIND=8) :: ORDER_MAX(1:32)
              REAL(KIND=8) :: DX
              INTEGER(KIND=4) :: NN
            END SUBROUTINE CMP_MINMAXORDER
          END INTERFACE 
        END MODULE CMP_MINMAXORDER__genmod
