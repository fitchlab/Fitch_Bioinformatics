#!/bin/bash
#$ -V
#$ -cwd
#$ -j y
#$ -o $JOB_ID_trinity.log

echo $HOSTNAME
echo $F $R
echo $PREFIX

OUTDIR=`pwd`

mkdir -p /scratch/aworonik/$PREFIX/trinity
cd /scratch/aworonik/$PREFIX/trinity

/ceph/users/aworonik/.conda/envs/trinity_env/bin/Trinity \
--seqType fq \
--max_memory 500G \
--left $F \
--right $R \
--CPU $NSLOTS \
--full_cleanup

rsync -av * $OUTDIR

