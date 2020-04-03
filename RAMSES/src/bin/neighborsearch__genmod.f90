        !COMPILER-GENERATED INTERFACE MODULE: Mon Sep  9 11:20:41 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE NEIGHBORSEARCH__genmod
          INTERFACE 
            SUBROUTINE NEIGHBORSEARCH(XX,IND_CELL,IND_MAX,NP,COUNT,     &
     &ILEVEL,ACTION)
              USE AMR_COMMONS
              REAL(KIND=8) :: XX(1:NCOARSE+NGRIDMAX*8)
              INTEGER(KIND=4) :: IND_CELL(1:32)
              INTEGER(KIND=4) :: IND_MAX(1:32)
              INTEGER(KIND=4) :: NP
              INTEGER(KIND=4) :: COUNT
              INTEGER(KIND=4) :: ILEVEL
              INTEGER(KIND=4) :: ACTION
            END SUBROUTINE NEIGHBORSEARCH
          END INTERFACE 
        END MODULE NEIGHBORSEARCH__genmod
