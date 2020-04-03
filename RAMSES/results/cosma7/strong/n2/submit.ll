#!/bin/bash --login

#SBATCH -J ramses
#SBATCH -o ramses.o%J
#SBATCH -e ramses.o%J
#SBATCH -p cosma7
#SBATCH -A ds007
#SBATCH --ntasks 56
#SBATCH --exclusive
#SBATCH -t 01:00:00

module purge
module load intel_comp/2018-update2
module load intel_mpi/2018

export RAMSES_HOME=/cosma7/data/ds007/dc-bare2/ramses
export RAMSES_RUN_DIR=$RAMSES_HOME/runs/strong/n2

cd $RAMSES_RUN_DIR
rm -rf output_*

mpirun -np $SLURM_NTASKS $RAMSES_HOME/bin/ramses3d $RAMSES_RUN_DIR/params.nml
