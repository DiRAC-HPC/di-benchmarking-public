# DiRAC: RAMSES Benchmark

This section provides information, results and analyses of the DiRAC RAMSES benchmark.

The benchmark performance has been evaluated on the following platforms:

| System | Node | Interconnect |
|--------|------|--------------|
| DiRAC Memory Intensive (COSMA7) | 2x Intel Xeon Skylake Gold 5120, 512 GiB DDR4 | Mellanox EDR |
| DiRAC Extreme Scaling (Tesseract) | 2x Intel Xeon Skylake Silver 4112, 96 GiB DDR4 | Intel OPA |

Subdirectories:

   - [src/](src/) - The RAMSES software source code (for these benchmarks)
   - [doc/](doc/) - Information on compiling, running and extracting performance data for the RAMSES benchmarks on different systems
   - [data/](data/) - Information on obtaining the input files for the benchmark runs
   - [results/](results/) - Output from benchmark runs on different systems
   - [analysis/](analysis/) - Scripts for extracting performance from benchmark outputs, performance comparisons between different systems
   
The documentation for running the RAMSES benchmarks is structured according to the target platforms. For example, the
instructions for running RAMSES on Tesseract can be found in [doc/tesseract/](doc/tesseract/), and within that folder are
three text files, init, make and run. The init text file shows how to deploy the RAMSES source/data to Tesseract. The make
instructions tell you how to build RAMSES alongwith any pre-requisite software components. Finally, the run text file explains
how to run the benchmarks. Similar text files exist for all the other target platforms.

Once the RAMSES benchmarks have been run on all the machines, you can then gather the performance data into
two text files, one for strong scaling and the other for weak scaling, see the instructions given in [doc/analysis.txt](doc/analysis.txt). Please note, the resulting text files, [results/scaling_strong.txt](results/scaling_strong.txt) and [results/scaling_weak.txt](results/scaling_weak.txt), contain comments that explain the format of the data contained
therein. The analysis instructions also explain how to create plots from the performance data.

## Obtaining the RAMSES source code

You can obtain the RAMSES source code from the public bitbucket repository at:

   - https://bitbucket.org/rteyssie/ramses/src/master/

For the benchmarks, we used the `stable_18_09` version. You can obtain this version with:

```
git clone --branch stable_18_09 https://bitbucket.org/rteyssie/ramses
```

