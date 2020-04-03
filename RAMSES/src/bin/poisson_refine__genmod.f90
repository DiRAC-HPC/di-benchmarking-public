        !COMPILER-GENERATED INTERFACE MODULE: Mon Sep  9 11:20:24 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE POISSON_REFINE__genmod
          INTERFACE 
            SUBROUTINE POISSON_REFINE(IND_CELL,OK,NCELL,ILEVEL)
              INTEGER(KIND=4) :: IND_CELL(1:32)
              LOGICAL(KIND=4) :: OK(1:32)
              INTEGER(KIND=4) :: NCELL
              INTEGER(KIND=4) :: ILEVEL
            END SUBROUTINE POISSON_REFINE
          END INTERFACE 
        END MODULE POISSON_REFINE__genmod
