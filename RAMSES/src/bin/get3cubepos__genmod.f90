        !COMPILER-GENERATED INTERFACE MODULE: Mon Sep  9 11:20:27 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE GET3CUBEPOS__genmod
          INTERFACE 
            SUBROUTINE GET3CUBEPOS(IND_GRID,IND,NBORS_FATHER_CELLS,     &
     &NBORS_FATHER_GRIDS,NG)
              INTEGER(KIND=4) :: IND_GRID(1:32)
              INTEGER(KIND=4) :: IND
              INTEGER(KIND=4) :: NBORS_FATHER_CELLS(1:32,1:27)
              INTEGER(KIND=4) :: NBORS_FATHER_GRIDS(1:32,1:8)
              INTEGER(KIND=4) :: NG
            END SUBROUTINE GET3CUBEPOS
          END INTERFACE 
        END MODULE GET3CUBEPOS__genmod
