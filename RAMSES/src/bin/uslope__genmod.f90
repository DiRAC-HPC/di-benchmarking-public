        !COMPILER-GENERATED INTERFACE MODULE: Mon Sep  9 11:20:32 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE USLOPE__genmod
          INTERFACE 
            SUBROUTINE USLOPE(Q,DQ,DX,DT,NGRID)
              REAL(KIND=8) :: Q(1:32,-1:4,-1:4,-1:4,1:6)
              REAL(KIND=8) :: DQ(1:32,-1:4,-1:4,-1:4,1:6,1:3)
              REAL(KIND=8) :: DX
              REAL(KIND=8) :: DT
              INTEGER(KIND=4) :: NGRID
            END SUBROUTINE USLOPE
          END INTERFACE 
        END MODULE USLOPE__genmod
