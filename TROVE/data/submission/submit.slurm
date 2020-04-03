#!/bin/bash
#SBATCH -A #ACCOUNT#
#SBATCH -N 2
#SBATCH -n 32
#SBATCH -t 4:0:0
#SBATCH -p #QUEUE#

# Load req'd modules
module purge
module load rhel7/default-peta4

WORKDIR=#WORK_DIR#
TROVE=#PATH_TO_j_trove.x#
INFILE=#INPUT_FILE#
OUTFILE=#OUTPUT_FILE_NAME#

cd $WORKDIR

# Ex. 2 nodes, 2 processes per node, 16 OMP threads
export OMP_NUM_THREADS=16
mpirun -ppn 2 $TROVE $INFILE > $OUTFILE.1n.2x16

