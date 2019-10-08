#!/bin/bash
#$ -V
#$ -cwd
#$ -j y
#$ -o $JOB_ID_cat_fq.log


echo $HOSTNAME
echo $PREFIX

OUTDIR=`pwd`

mkdir -p /scratch/aworonik/bamfilter/$PREFIX
cd /scratch/aworonik/bamfilter/$PREFIX

cat /data/projects/caenorhabditis/analyses/alyssa/$PREFIX.InUn.fq /data/projects/caenorhabditis/analyses/alyssa/$PREFIX.$PREFIX.UnUn.fq > $PREFIX_InUn_UnUn_cat.fq 
/data/projects/caenorhabditis/analyses/alyssa/deinterleave_fastq.sh < $PREFIX_InUn_UnUn_cat.fq $PREFIX_InUn_UnUn_f.fastq $PREFIX_InUn_UnUn_r.fastq

rsync -av * $OUTDIR
