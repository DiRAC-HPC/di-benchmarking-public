# DiRAC: sphNG Benchmark

This section provides information, results and analyses of the DiRAC sphNG benchmark.

The benchmark performance has been evaluated on the following platforms:

| System | Node | Interconnect |
|--------|------|--------------|
| DiRAC Memory Intensive (COSMA7) | 2x Intel Xeon Skylake Gold 5120, 512 GiB DDR4 | Mellanox EDR |
| DiRAC Extreme Scaling (Tesseract) | 2x Intel Xeon Skylake Silver 4112, 96 GiB DDR4 | Intel OPA |

Subdirectories:

   - [doc/](doc/) - Information on compiling, running and extracting performance data for the sphNG benchmarks on different systems
   - [data/](data/) - Information on obtaining the input files for the benchmark runs
   - [results/](results/) - Parameter files, job submission scripts and output from benchmark runs on different systems
   - [analysis/](analysis/) - Scripts for extracting performance from benchmark outputs, performance comparisons between different systems
   
The documentation for running the sphNG benchmarks is structured according to the target platforms. For example, the
instructions for running sphNG on Tesseract can be found in [doc/tesseract/](doc/tesseract/), and within that folder are
three text files, init, make and run. The init text file shows how to deploy the sphNG source/data to Tesseract. The make
instructions tell you how to build sphNG alongwith any pre-requisite software components. Finally, the run text file explains
how to run the benchmarks. Similar text files exist for all the other target platforms.

Once the sphNG benchmarks have been run on all the machines, you can then gather the performance data into
three text files, one for strong scaling, one for weak scaling and the other for single node performance, see the instructions
given in [doc/analysis.txt](doc/analysis.txt). Please note, the resulting text files, [results/scaling_strong.txt](results/scaling_strong.txt), [results/scaling_weak.txt](results/scaling_weak.txt) and [results/scaling_single.txt](results/scaling_single.txt), contain comments that explain the format of the data contained therein. The analysis
instructions also explain how to create plots from the performance data.
