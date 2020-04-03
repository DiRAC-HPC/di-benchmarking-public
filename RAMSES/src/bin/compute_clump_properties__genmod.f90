        !COMPILER-GENERATED INTERFACE MODULE: Mon Sep  9 11:20:42 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_CLUMP_PROPERTIES__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_CLUMP_PROPERTIES(XX)
              USE AMR_COMMONS
              USE HYDRO_COMMONS, ONLY :                                 &
     &          UOLD
              REAL(KIND=8) :: XX(1:NCOARSE+NGRIDMAX*8)
            END SUBROUTINE COMPUTE_CLUMP_PROPERTIES
          END INTERFACE 
        END MODULE COMPUTE_CLUMP_PROPERTIES__genmod
