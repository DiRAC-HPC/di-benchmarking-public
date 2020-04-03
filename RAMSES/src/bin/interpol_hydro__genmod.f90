        !COMPILER-GENERATED INTERFACE MODULE: Mon Sep  9 11:20:32 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE INTERPOL_HYDRO__genmod
          INTERFACE 
            SUBROUTINE INTERPOL_HYDRO(U1,U2,NN)
              REAL(KIND=8) :: U1(1:32,0:6,1:6)
              REAL(KIND=8) :: U2(1:32,1:8,1:6)
              INTEGER(KIND=4) :: NN
            END SUBROUTINE INTERPOL_HYDRO
          END INTERFACE 
        END MODULE INTERPOL_HYDRO__genmod
