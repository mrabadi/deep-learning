#!/bin/bash
#PBS -l nodes=1:ppn=1:gpus=1:titan
#PBS -l walltime=00:00:10
#PBS -l mem=4GB
#PBS -j A1test
#PBS -M davidgarwin@gmail.com

module purge
module load cuda/6.5.12
export PATH=$PATH:/scratch/courses/DSGA1008/bin
DATADIR=/scratch/courses/DSGA1008/A1
RUNDIR=$SCRATCH/A1/run-${PBS_JOBID/.*}
mkdir -p $RUNDIR
cd $SCRATCH
cp *.lua $RUNDIR
cd $RUNDIR
ln -s $DATADIR/*.t7 
th doall -size small -type cuda -retrain false > out
