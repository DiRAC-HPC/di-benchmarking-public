        !COMPILER-GENERATED INTERFACE MODULE: Mon Sep  9 11:20:24 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE OUTPUT_TIMER__genmod
          INTERFACE 
            SUBROUTINE OUTPUT_TIMER(WRITE_FILE,FILENAME)
              USE AMR_COMMONS
              LOGICAL(KIND=4) :: WRITE_FILE
              CHARACTER(LEN=80) :: FILENAME
            END SUBROUTINE OUTPUT_TIMER
          END INTERFACE 
        END MODULE OUTPUT_TIMER__genmod
