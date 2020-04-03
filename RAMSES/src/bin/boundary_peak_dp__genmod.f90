        !COMPILER-GENERATED INTERFACE MODULE: Mon Sep  9 11:20:42 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE BOUNDARY_PEAK_DP__genmod
          INTERFACE 
            SUBROUTINE BOUNDARY_PEAK_DP(XX)
              USE CLFIND_COMMONS
              USE AMR_COMMONS
              REAL(KIND=8) :: XX(1:NPEAKS_MAX)
            END SUBROUTINE BOUNDARY_PEAK_DP
          END INTERFACE 
        END MODULE BOUNDARY_PEAK_DP__genmod
