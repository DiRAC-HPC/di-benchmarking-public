        !COMPILER-GENERATED INTERFACE MODULE: Mon Sep  9 11:20:40 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COUNT_TEST_PARTICLE__genmod
          INTERFACE 
            SUBROUTINE COUNT_TEST_PARTICLE(XX,ILEVEL,NSKIP,ACTION)
              USE AMR_COMMONS
              REAL(KIND=8) :: XX(1:NCOARSE+NGRIDMAX*8)
              INTEGER(KIND=4) :: ILEVEL
              INTEGER(KIND=4) :: NSKIP
              INTEGER(KIND=4) :: ACTION
            END SUBROUTINE COUNT_TEST_PARTICLE
          END INTERFACE 
        END MODULE COUNT_TEST_PARTICLE__genmod
