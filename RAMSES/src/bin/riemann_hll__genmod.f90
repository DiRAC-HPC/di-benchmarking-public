        !COMPILER-GENERATED INTERFACE MODULE: Mon Sep  9 11:20:33 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE RIEMANN_HLL__genmod
          INTERFACE 
            SUBROUTINE RIEMANN_HLL(QLEFT,QRIGHT,FGDNV,NGRID)
              REAL(KIND=8) :: QLEFT(1:32,1:6)
              REAL(KIND=8) :: QRIGHT(1:32,1:6)
              REAL(KIND=8) :: FGDNV(1:32,1:7)
              INTEGER(KIND=4) :: NGRID
            END SUBROUTINE RIEMANN_HLL
          END INTERFACE 
        END MODULE RIEMANN_HLL__genmod
