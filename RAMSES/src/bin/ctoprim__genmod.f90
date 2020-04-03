        !COMPILER-GENERATED INTERFACE MODULE: Mon Sep  9 11:20:31 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE CTOPRIM__genmod
          INTERFACE 
            SUBROUTINE CTOPRIM(UIN,Q,C,GRAVIN,DT,NGRID)
              REAL(KIND=8) :: UIN(1:32,-1:4,-1:4,-1:4,1:6)
              REAL(KIND=8) :: Q(1:32,-1:4,-1:4,-1:4,1:6)
              REAL(KIND=8) :: C(1:32,-1:4,-1:4,-1:4)
              REAL(KIND=8) :: GRAVIN(1:32,-1:4,-1:4,-1:4,1:3)
              REAL(KIND=8) :: DT
              INTEGER(KIND=4) :: NGRID
            END SUBROUTINE CTOPRIM
          END INTERFACE 
        END MODULE CTOPRIM__genmod
