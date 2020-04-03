#!/bin/bash --login

#SBATCH -J sphng
#SBATCH -o sphng.o%j
#SBATCH -e sphng.o%j
#SBATCH -p cosma7
#SBATCH -A ds007
#SBATCH --nodes=8
#SBATCH --ntasks=16
#SBATCH --ntasks-per-node=2
#SBATCH --exclusive
#SBATCH -t 03:00:00


export nodecnt=$SLURM_JOB_NUM_NODES
export corecnt=`expr ${SLURM_CPUS_ON_NODE} \* ${nodecnt}`
export mpicnt=$SLURM_NTASKS
export threadspermpi=`expr ${SLURM_CPUS_ON_NODE} \/ ${SLURM_NTASKS_PER_NODE}`
export threadcnt=`expr ${mpicnt} \* ${threadspermpi}`
export OMP_NUM_THREADS=$threadspermpi
export I_MPI_PIN_DOMAIN=omp

if [ $threadcnt -ne $corecnt ]
then
  echo "Error, mismatch between requested and available hardware!"
  exit -1
fi


module purge
module load intel_comp/2018-update2
module load intel_mpi/2018


export SPH_ROOT=/cosma7/data/ds007/dc-bare2/sphng
export SPH_EXE_DIR=$SPH_ROOT/bin
export SPH_HOME=$SPH_ROOT/runs/strong/n$SLURM_JOB_NUM_NODES
cd $SPH_HOME


mpirun -n $SLURM_NTASKS -ppn $SLURM_NTASKS_PER_NODE $SPH_EXE_DIR/sph_tree_rk_gradh initial ifile < $SPH_HOME/setup.txt &> sphng_setup.o
mpirun -n $SLURM_NTASKS -ppn $SLURM_NTASKS_PER_NODE $SPH_EXE_DIR/sph_tree_rk_gradh evolution ifile
