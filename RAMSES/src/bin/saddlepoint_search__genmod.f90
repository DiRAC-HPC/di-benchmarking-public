        !COMPILER-GENERATED INTERFACE MODULE: Mon Sep  9 11:20:41 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SADDLEPOINT_SEARCH__genmod
          INTERFACE 
            SUBROUTINE SADDLEPOINT_SEARCH(XX)
              USE AMR_COMMONS
              REAL(KIND=8) :: XX(1:NCOARSE+NGRIDMAX*8)
            END SUBROUTINE SADDLEPOINT_SEARCH
          END INTERFACE 
        END MODULE SADDLEPOINT_SEARCH__genmod
