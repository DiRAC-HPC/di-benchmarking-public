# Getting the code #

Clone https://github.com/RSE-Cambridge/TROVE

Checkout branch gfortran-mpi

# Requirements #

A working MPI library and either: 
 - Intel Fortran compiler  2017, 2018u4, or 2019 + MKL
   - Note: early Intel 2018 Fortran compiler has a bug that breaks the use of
	   certain mpi_f08 routines 
 - GNU Fortran + LAPACK + BLAS library (e.g. OpenBLAS) + Scalapack

# Compilation #

By default the build system is set up for Intel Fortran + MKL. Simply running
`make` in the source directory should do the trick. For gfortran, edit
`makefile` and change the FOR, FFLAGS and LAPACK parameters as required.

# Running #

The code compiles to the binary `j-trove.x`. Run the code with `mpirun j-trove.x
<inputfile> > <outputfile>`. Slurm and PBS submission script examples are provided.

## MPI vs OpenMP ##

TROVE is parallelised using hybrid OpenMP/MPI. It is worth experimenting with
the ratio of processes to threads to find optimal performance, but generally
TROVE prefers MPI parallelism over OpenMP for the inputs in this benchmark. It
is however recommended to have at least one MPI process per NUMA domain.

# Benchmark input #

The input files included with this benchmark are derived from the `H2CO-1`
benchmark found at https://github.com/trovemaster/TROVE-benchmarks. `N12.inp` is
identical to `file1.inp` from `H2CO-1`, except the addition of an extra
parameter to enable MPI-IO enabled file I/O. `N14.inp` and `N16.inp` are
variants of the same input with a larger basis set.

`N12` is well-suited for single to 4-node benchmarks, `N14` for 4 to 8, and
`N16` for 10+ nodes.

# Output verification #

Sample outputs from benchmarked DiRAC systems are included in the `../results`
directory. For result verification we are interested in the very last lines of
the output file; the very last line similar to the following from N12:

` B2     1826  21145.470034   ( A1 ;  0  0  0 ) ( A1  A1  B2  A1 ;   6   0   0   1   5   0 )      0.23 (   6   0   0   6   0   0   0 ) (     7     1    27     1 )`

... _must_ be identical for `NXX` inputs (but not between different `NXX`).

Finally we are interested in the timing reports, specifically the 'Total time'
value for `Contracted matelements-class`,`contract_matrix_sum_field`,
`MPI_transpose`, and `MPI_write_matrix`.
