        !COMPILER-GENERATED INTERFACE MODULE: Mon Sep  9 11:20:28 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_REPLICA__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_REPLICA(THETAYRAD,THETAZRAD,DIST1,DIST2, &
     &OBSERVER,LBOX,ROT,NREPXM,NREPXP,NREPYM,NREPYP,NREPZM,NREPZP)
              REAL(KIND=8) :: THETAYRAD
              REAL(KIND=8) :: THETAZRAD
              REAL(KIND=8) :: DIST1
              REAL(KIND=8) :: DIST2
              REAL(KIND=8) :: OBSERVER(3)
              REAL(KIND=8) :: LBOX
              REAL(KIND=8) :: ROT(3,3)
              INTEGER(KIND=4) :: NREPXM
              INTEGER(KIND=4) :: NREPXP
              INTEGER(KIND=4) :: NREPYM
              INTEGER(KIND=4) :: NREPYP
              INTEGER(KIND=4) :: NREPZM
              INTEGER(KIND=4) :: NREPZP
            END SUBROUTINE COMPUTE_REPLICA
          END INTERFACE 
        END MODULE COMPUTE_REPLICA__genmod
