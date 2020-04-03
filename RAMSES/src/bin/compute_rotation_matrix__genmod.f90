        !COMPILER-GENERATED INTERFACE MODULE: Mon Sep  9 11:20:28 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_ROTATION_MATRIX__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_ROTATION_MATRIX(THETASHIFTRAD,PHISHIFTRAD&
     &,ROT,ROTM1)
              REAL(KIND=8) :: THETASHIFTRAD
              REAL(KIND=8) :: PHISHIFTRAD
              REAL(KIND=8) :: ROT(3,3)
              REAL(KIND=8) :: ROTM1(3,3)
            END SUBROUTINE COMPUTE_ROTATION_MATRIX
          END INTERFACE 
        END MODULE COMPUTE_ROTATION_MATRIX__genmod
