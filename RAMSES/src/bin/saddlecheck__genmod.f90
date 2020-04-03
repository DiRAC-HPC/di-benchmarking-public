        !COMPILER-GENERATED INTERFACE MODULE: Mon Sep  9 11:20:40 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SADDLECHECK__genmod
          INTERFACE 
            SUBROUTINE SADDLECHECK(XX,IND_CELL,CELL_INDEX,CLUMP_NR,OK,NP&
     &)
              USE AMR_COMMONS
              REAL(KIND=8) :: XX(1:NCOARSE+NGRIDMAX*8)
              INTEGER(KIND=4) :: IND_CELL
              INTEGER(KIND=4) :: CELL_INDEX(1:99)
              INTEGER(KIND=4) :: CLUMP_NR
              LOGICAL(KIND=4) :: OK(1:99)
              INTEGER(KIND=4) :: NP
            END SUBROUTINE SADDLECHECK
          END INTERFACE 
        END MODULE SADDLECHECK__genmod
