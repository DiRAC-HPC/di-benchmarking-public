        !COMPILER-GENERATED INTERFACE MODULE: Mon Sep  9 11:20:40 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PEAKCHECK__genmod
          INTERFACE 
            SUBROUTINE PEAKCHECK(XX,CELL_INDEX,OKPEAK,OK,DENSITY_MAX,   &
     &IND_MAX,NP)
              USE AMR_COMMONS
              REAL(KIND=8) :: XX(1:NCOARSE+NGRIDMAX*8)
              INTEGER(KIND=4) :: CELL_INDEX(1:99)
              LOGICAL(KIND=4) :: OKPEAK
              LOGICAL(KIND=4) :: OK(1:99)
              REAL(KIND=8) :: DENSITY_MAX
              INTEGER(KIND=4) :: IND_MAX
              INTEGER(KIND=4) :: NP
            END SUBROUTINE PEAKCHECK
          END INTERFACE 
        END MODULE PEAKCHECK__genmod
