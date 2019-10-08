#!/bin/bash
#$ -V
#$ -cwd
#$ -j y
#$ -o $JOB_ID_bowtie_ecoli.log

export PATH=/ceph/software/conda/bin/:$PATH
source activate main_env
source ~/virtenv/lstevens/bin/activate

/ceph/users/aworonik/.conda/envs/alyssa_blob/lib

echo $HOSTNAME
echo $PREFIX

OUTDIR=`pwd`

mkdir -p /scratch/aworonik/bowtie/$PREFIX
cd /scratch/aworonik/bowtie/$PREFIX

bowtie2-build /ceph/software/CGP-scripts/E_coli_strains/E_coli_strains.fna E_coli_strains

bowtie2 \
-x E_coli_strains \
-1 $F \
-2 $R \
-p 32 \
-S $PREFIX.sam


rsync -av * $OUTDIR
