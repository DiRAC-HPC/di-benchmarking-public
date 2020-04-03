        !COMPILER-GENERATED INTERFACE MODULE: Mon Sep  9 11:20:28 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE QUICK_SORT__genmod
          INTERFACE 
            SUBROUTINE QUICK_SORT(LIST,ORDER,N)
              INTEGER(KIND=4) :: N
              REAL(KIND=8), INTENT(INOUT) :: LIST(1:N)
              INTEGER(KIND=4), INTENT(OUT) :: ORDER(1:N)
            END SUBROUTINE QUICK_SORT
          END INTERFACE 
        END MODULE QUICK_SORT__genmod
