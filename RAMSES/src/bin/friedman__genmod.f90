        !COMPILER-GENERATED INTERFACE MODULE: Mon Sep  9 11:20:23 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE FRIEDMAN__genmod
          INTERFACE 
            SUBROUTINE FRIEDMAN(O_MAT_0,O_VAC_0,O_K_0,ALPHA,AXP_MIN,    &
     &AXP_OUT,HEXP_OUT,TAU_OUT,T_OUT,NTABLE)
              INTEGER(KIND=4) :: NTABLE
              REAL(KIND=8) :: O_MAT_0
              REAL(KIND=8) :: O_VAC_0
              REAL(KIND=8) :: O_K_0
              REAL(KIND=8) :: ALPHA
              REAL(KIND=8) :: AXP_MIN
              REAL(KIND=8) :: AXP_OUT(0:NTABLE)
              REAL(KIND=8) :: HEXP_OUT(0:NTABLE)
              REAL(KIND=8) :: TAU_OUT(0:NTABLE)
              REAL(KIND=8) :: T_OUT(0:NTABLE)
            END SUBROUTINE FRIEDMAN
          END INTERFACE 
        END MODULE FRIEDMAN__genmod
