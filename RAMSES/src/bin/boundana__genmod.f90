        !COMPILER-GENERATED INTERFACE MODULE: Mon Sep  9 11:20:33 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE BOUNDANA__genmod
          INTERFACE 
            SUBROUTINE BOUNDANA(X,U,DX,IBOUND,NCELL)
              REAL(KIND=8) :: X(1:32,1:3)
              REAL(KIND=8) :: U(1:32,1:6)
              REAL(KIND=8) :: DX
              INTEGER(KIND=4) :: IBOUND
              INTEGER(KIND=4) :: NCELL
            END SUBROUTINE BOUNDANA
          END INTERFACE 
        END MODULE BOUNDANA__genmod
