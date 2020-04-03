        !COMPILER-GENERATED INTERFACE MODULE: Mon Sep  9 11:20:42 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE BOUNDARY_PEAK_INT__genmod
          INTERFACE 
            SUBROUTINE BOUNDARY_PEAK_INT(XX)
              USE CLFIND_COMMONS
              USE AMR_COMMONS
              INTEGER(KIND=4) :: XX(1:NPEAKS_MAX)
            END SUBROUTINE BOUNDARY_PEAK_INT
          END INTERFACE 
        END MODULE BOUNDARY_PEAK_INT__genmod
