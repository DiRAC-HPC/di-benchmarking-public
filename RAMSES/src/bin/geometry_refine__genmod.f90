        !COMPILER-GENERATED INTERFACE MODULE: Mon Sep  9 11:20:24 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE GEOMETRY_REFINE__genmod
          INTERFACE 
            SUBROUTINE GEOMETRY_REFINE(XX,OK,NCELL,ILEVEL)
              REAL(KIND=8) :: XX(1:32,1:3)
              LOGICAL(KIND=4) :: OK(1:32)
              INTEGER(KIND=4) :: NCELL
              INTEGER(KIND=4) :: ILEVEL
            END SUBROUTINE GEOMETRY_REFINE
          END INTERFACE 
        END MODULE GEOMETRY_REFINE__genmod
