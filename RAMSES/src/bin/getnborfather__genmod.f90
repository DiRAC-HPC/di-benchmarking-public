        !COMPILER-GENERATED INTERFACE MODULE: Mon Sep  9 11:20:27 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE GETNBORFATHER__genmod
          INTERFACE 
            SUBROUTINE GETNBORFATHER(IND_CELL,IND_FATHER,NCELL,ILEVEL)
              INTEGER(KIND=4) :: IND_CELL(1:32)
              INTEGER(KIND=4) :: IND_FATHER(1:32,0:6)
              INTEGER(KIND=4) :: NCELL
              INTEGER(KIND=4) :: ILEVEL
            END SUBROUTINE GETNBORFATHER
          END INTERFACE 
        END MODULE GETNBORFATHER__genmod