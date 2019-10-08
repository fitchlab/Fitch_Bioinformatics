#!/bin/bash
#$ -V
#$ -cwd
#$ -j y
#$ -o $JOB_ID_repeat_modeler.log


echo $HOSTNAME
echo $PREFIX

OUTDIR=`pwd`

mkdir -p /scratch/aworonik/repeat/$PREFIX
cd /scratch/aworonik/repeat/$PREFIX

export PATH=/ceph/software/conda/bin/:$PATH
source activate main_env
samtools faidx /data/projects/caenorhabditis/analyses/alyssa/$PREFIX.spades2_scaf_greater_200.fasta


source activate annotation_env


BuildDatabase -name $PREFIX -engine ncbi /data/projects/caenorhabditis/analyses/alyssa/$PREFIX.spades2_scaf_greater_200.fasta

RepeatModeler -engine ncbi -pa 16 -database /data/projects/caenorhabditis/analyses/alyssa/$PREFIX

rsync -av * $OUTDIR
