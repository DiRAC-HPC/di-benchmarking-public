        !COMPILER-GENERATED INTERFACE MODULE: Mon Sep  9 11:20:39 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE CIC_GET_VALS__genmod
          INTERFACE 
            SUBROUTINE CIC_GET_VALS(FLUID_VAR,IND_GRID,XPART,           &
     &IND_GRID_PART,NG,NP,ILEVEL,ILEVEL_ONLY)
              REAL(KIND=8) :: FLUID_VAR(1:32,1:6)
              INTEGER(KIND=4) :: IND_GRID(1:32)
              REAL(KIND=8) :: XPART(1:32,1:3)
              INTEGER(KIND=4) :: IND_GRID_PART(1:32)
              INTEGER(KIND=4) :: NG
              INTEGER(KIND=4) :: NP
              INTEGER(KIND=4) :: ILEVEL
              LOGICAL(KIND=4) :: ILEVEL_ONLY
            END SUBROUTINE CIC_GET_VALS
          END INTERFACE 
        END MODULE CIC_GET_VALS__genmod
