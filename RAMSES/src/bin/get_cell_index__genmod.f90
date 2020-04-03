        !COMPILER-GENERATED INTERFACE MODULE: Mon Sep  9 11:20:40 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE GET_CELL_INDEX__genmod
          INTERFACE 
            SUBROUTINE GET_CELL_INDEX(CELL_INDEX,CELL_LEVL,XPART,ILEVEL,&
     &N)
              INTEGER(KIND=4) :: CELL_INDEX(1:32)
              INTEGER(KIND=4) :: CELL_LEVL(1:32)
              REAL(KIND=8) :: XPART(1:32,1:3)
              INTEGER(KIND=4) :: ILEVEL
              INTEGER(KIND=4) :: N
            END SUBROUTINE GET_CELL_INDEX
          END INTERFACE 
        END MODULE GET_CELL_INDEX__genmod
