        !COMPILER-GENERATED INTERFACE MODULE: Mon Sep  9 11:20:41 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COUNT_PEAKS__genmod
          INTERFACE 
            SUBROUTINE COUNT_PEAKS(XX,N)
              USE AMR_COMMONS
              REAL(KIND=8) :: XX(1:NCOARSE+NGRIDMAX*8)
              INTEGER(KIND=4) :: N
            END SUBROUTINE COUNT_PEAKS
          END INTERFACE 
        END MODULE COUNT_PEAKS__genmod
