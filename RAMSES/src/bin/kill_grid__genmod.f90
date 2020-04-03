        !COMPILER-GENERATED INTERFACE MODULE: Mon Sep  9 11:20:26 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE KILL_GRID__genmod
          INTERFACE 
            SUBROUTINE KILL_GRID(IND_CELL,ILEVEL,NN,IBOUND,             &
     &BOUNDARY_REGION)
              INTEGER(KIND=4) :: IND_CELL(1:32)
              INTEGER(KIND=4) :: ILEVEL
              INTEGER(KIND=4) :: NN
              INTEGER(KIND=4) :: IBOUND
              LOGICAL(KIND=4) :: BOUNDARY_REGION
            END SUBROUTINE KILL_GRID
          END INTERFACE 
        END MODULE KILL_GRID__genmod
