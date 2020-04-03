        !COMPILER-GENERATED INTERFACE MODULE: Mon Sep  9 11:20:43 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE INTERPOL_PHI__genmod
          INTERFACE 
            SUBROUTINE INTERPOL_PHI(IND_CELL,PHI_INT,NCELL,ILEVEL,ICOUNT&
     &)
              INTEGER(KIND=4) :: IND_CELL(1:32)
              REAL(KIND=8) :: PHI_INT(1:32,1:8)
              INTEGER(KIND=4) :: NCELL
              INTEGER(KIND=4) :: ILEVEL
              INTEGER(KIND=4) :: ICOUNT
            END SUBROUTINE INTERPOL_PHI
          END INTERFACE 
        END MODULE INTERPOL_PHI__genmod
