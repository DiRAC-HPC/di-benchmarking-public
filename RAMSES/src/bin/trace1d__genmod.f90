        !COMPILER-GENERATED INTERFACE MODULE: Mon Sep  9 11:20:31 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE TRACE1D__genmod
          INTERFACE 
            SUBROUTINE TRACE1D(Q,DQ,QM,QP,DX,DT,NGRID)
              REAL(KIND=8) :: Q(1:32,-1:4,-1:4,-1:4,1:6)
              REAL(KIND=8) :: DQ(1:32,-1:4,-1:4,-1:4,1:6,1:3)
              REAL(KIND=8) :: QM(1:32,-1:4,-1:4,-1:4,1:6,1:3)
              REAL(KIND=8) :: QP(1:32,-1:4,-1:4,-1:4,1:6,1:3)
              REAL(KIND=8) :: DX
              REAL(KIND=8) :: DT
              INTEGER(KIND=4) :: NGRID
            END SUBROUTINE TRACE1D
          END INTERFACE 
        END MODULE TRACE1D__genmod
