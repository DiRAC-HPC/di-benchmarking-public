        !COMPILER-GENERATED INTERFACE MODULE: Mon Sep  9 11:20:32 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE CMPDT__genmod
          INTERFACE 
            SUBROUTINE CMPDT(UU,GG,DX,DT,NCELL)
              REAL(KIND=8) :: UU(1:32,1:6)
              REAL(KIND=8) :: GG(1:32,1:3)
              REAL(KIND=8) :: DX
              REAL(KIND=8) :: DT
              INTEGER(KIND=4) :: NCELL
            END SUBROUTINE CMPDT
          END INTERFACE 
        END MODULE CMPDT__genmod
