        !COMPILER-GENERATED INTERFACE MODULE: Mon Sep  9 11:20:40 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE FLAG_PEAKS__genmod
          INTERFACE 
            SUBROUTINE FLAG_PEAKS(XX,IPEAK)
              USE AMR_COMMONS
              REAL(KIND=8) :: XX(1:NCOARSE+NGRIDMAX*8)
              INTEGER(KIND=4) :: IPEAK
            END SUBROUTINE FLAG_PEAKS
          END INTERFACE 
        END MODULE FLAG_PEAKS__genmod
