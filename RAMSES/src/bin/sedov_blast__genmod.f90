        !COMPILER-GENERATED INTERFACE MODULE: Mon Sep  9 11:20:40 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SEDOV_BLAST__genmod
          INTERFACE 
            SUBROUTINE SEDOV_BLAST(XSN,VSN,MSN,SSN,ZSN,INDSN,VOL_GAS,DQ,&
     &EKBLAST,NSN)
              INTEGER(KIND=4) :: NSN
              REAL(KIND=8) :: XSN(1:NSN,1:3)
              REAL(KIND=8) :: VSN(1:NSN,1:3)
              REAL(KIND=8) :: MSN(1:NSN)
              REAL(KIND=8) :: SSN(1:NSN)
              REAL(KIND=8) :: ZSN(1:NSN)
              INTEGER(KIND=4) :: INDSN(1:NSN)
              REAL(KIND=8) :: VOL_GAS(1:NSN)
              REAL(KIND=8) :: DQ(1:NSN,1:3)
              REAL(KIND=8) :: EKBLAST(1:NSN)
            END SUBROUTINE SEDOV_BLAST
          END INTERFACE 
        END MODULE SEDOV_BLAST__genmod
