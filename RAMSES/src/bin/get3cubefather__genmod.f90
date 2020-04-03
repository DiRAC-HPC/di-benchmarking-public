        !COMPILER-GENERATED INTERFACE MODULE: Mon Sep  9 11:20:27 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE GET3CUBEFATHER__genmod
          INTERFACE 
            SUBROUTINE GET3CUBEFATHER(IND_CELL_FATHER,NBORS_FATHER_CELLS&
     &,NBORS_FATHER_GRIDS,NCELL,ILEVEL)
              INTEGER(KIND=4) :: IND_CELL_FATHER(1:32)
              INTEGER(KIND=4) :: NBORS_FATHER_CELLS(1:32,1:27)
              INTEGER(KIND=4) :: NBORS_FATHER_GRIDS(1:32,1:8)
              INTEGER(KIND=4) :: NCELL
              INTEGER(KIND=4) :: ILEVEL
            END SUBROUTINE GET3CUBEFATHER
          END INTERFACE 
        END MODULE GET3CUBEFATHER__genmod
