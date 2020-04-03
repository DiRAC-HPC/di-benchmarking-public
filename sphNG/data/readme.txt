The input data for the sphNG benchmarks comes in the form of two short input files,
"inspho" and "setup.txt".

The first file, "inspho", is identical for all benchmark runs and so has been
duplicated for all the different cases, see the results folder.

The second file, "setup.txt", is identical for all the single node and strong
scaling runs. For weak scaling, the number of particles defined on the 11th line
is varied in line with the number of compute nodes. A separate "setup.txt" file
is held for each benchmark run within the results folder. 