        !COMPILER-GENERATED INTERFACE MODULE: Mon Sep  9 11:20:25 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE MAKE_VIRTUAL_FINE_INT__genmod
          INTERFACE 
            SUBROUTINE MAKE_VIRTUAL_FINE_INT(XX,ILEVEL)
              USE AMR_COMMONS
              INTEGER(KIND=4) :: XX(1:NCOARSE+NGRIDMAX*8)
              INTEGER(KIND=4) :: ILEVEL
            END SUBROUTINE MAKE_VIRTUAL_FINE_INT
          END INTERFACE 
        END MODULE MAKE_VIRTUAL_FINE_INT__genmod
