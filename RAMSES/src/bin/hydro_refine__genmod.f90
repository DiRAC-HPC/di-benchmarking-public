        !COMPILER-GENERATED INTERFACE MODULE: Mon Sep  9 11:20:32 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE HYDRO_REFINE__genmod
          INTERFACE 
            SUBROUTINE HYDRO_REFINE(UG,UM,UD,OK,NN)
              REAL(KIND=8) :: UG(1:32,1:6)
              REAL(KIND=8) :: UM(1:32,1:6)
              REAL(KIND=8) :: UD(1:32,1:6)
              LOGICAL(KIND=4) :: OK(1:32)
              INTEGER(KIND=4) :: NN
            END SUBROUTINE HYDRO_REFINE
          END INTERFACE 
        END MODULE HYDRO_REFINE__genmod
