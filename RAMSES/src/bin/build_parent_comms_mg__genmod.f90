        !COMPILER-GENERATED INTERFACE MODULE: Mon Sep  9 11:20:44 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE BUILD_PARENT_COMMS_MG__genmod
          INTERFACE 
            SUBROUTINE BUILD_PARENT_COMMS_MG(ACTIVE_F_COMM,IFINELEVEL)
              USE AMR_COMMONS
              TYPE (COMMUNICATOR), INTENT(IN) :: ACTIVE_F_COMM
              INTEGER(KIND=4), INTENT(IN) :: IFINELEVEL
            END SUBROUTINE BUILD_PARENT_COMMS_MG
          END INTERFACE 
        END MODULE BUILD_PARENT_COMMS_MG__genmod
