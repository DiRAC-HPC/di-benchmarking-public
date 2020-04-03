        !COMPILER-GENERATED INTERFACE MODULE: Mon Sep  9 11:20:39 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PRINT_SINK_PROPERTIES__genmod
          INTERFACE 
            SUBROUTINE PRINT_SINK_PROPERTIES(DMEDOVERDT,DMEDOVERDT_SMBH,&
     &RHO_INF,R2)
              USE PM_COMMONS
              REAL(KIND=8) :: DMEDOVERDT(1:NSINKMAX)
              REAL(KIND=8) :: DMEDOVERDT_SMBH(1:NSINKMAX)
              REAL(KIND=8) :: RHO_INF
              REAL(KIND=8) :: R2
            END SUBROUTINE PRINT_SINK_PROPERTIES
          END INTERFACE 
        END MODULE PRINT_SINK_PROPERTIES__genmod
