        !COMPILER-GENERATED INTERFACE MODULE: Mon Sep  9 11:20:31 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE CONSUP__genmod
          INTERFACE 
            SUBROUTINE CONSUP(UIN,FLUX,DIV,DT,NGRID)
              REAL(KIND=8) :: UIN(1:32,-1:4,-1:4,-1:4,1:6)
              REAL(KIND=8) :: FLUX(1:32,1:3,1:3,1:3,1:6,1:3)
              REAL(KIND=8) :: DIV(1:32,1:3,1:3,1:3)
              REAL(KIND=8) :: DT
              INTEGER(KIND=4) :: NGRID
            END SUBROUTINE CONSUP
          END INTERFACE 
        END MODULE CONSUP__genmod
