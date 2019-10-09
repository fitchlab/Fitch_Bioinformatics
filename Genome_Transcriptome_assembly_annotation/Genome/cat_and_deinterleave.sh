#!/bin/bash
#$ -V
#$ -cwd
#$ -j y
#$ -o $JOB_ID_cat_fq.log


echo $HOSTNAME
echo $PREFIX

OUTDIR=`pwd`

mkdir -p /scratch/aworonik/cat_de/$PREFIX
cd /scratch/aworonik/cat_de/$PREFIX

cat /data/projects/caenorhabditis/analyses/alyssa/$PREFIX.InUn.fq /data/projects/caenorhabditis/analyses/alyssa/$PREFIX.UnUn.fq > $PREFIX.InUn_UnUn_cat.fq
rsync -av * $OUTDIR
/data/projects/caenorhabditis/analyses/alyssa/deinterleave_fastq.sh < /data/projects/caenorhabditis/analyses/alyssa/$PREFIX.InUn_UnUn_cat.fq $PREFIX.InUn_UnUn_f.fastq $PREFIX.InUn_UnUn_r.fastq

rsync -av * $OUTDIR
