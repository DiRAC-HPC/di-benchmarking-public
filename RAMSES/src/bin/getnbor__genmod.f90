        !COMPILER-GENERATED INTERFACE MODULE: Mon Sep  9 11:20:38 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE GETNBOR__genmod
          INTERFACE 
            SUBROUTINE GETNBOR(IND_CELL,IND_FATHER,NCELL,ILEVEL)
              INTEGER(KIND=4) :: IND_CELL(1:32)
              INTEGER(KIND=4) :: IND_FATHER(1:32,0:6)
              INTEGER(KIND=4) :: NCELL
              INTEGER(KIND=4) :: ILEVEL
            END SUBROUTINE GETNBOR
          END INTERFACE 
        END MODULE GETNBOR__genmod
