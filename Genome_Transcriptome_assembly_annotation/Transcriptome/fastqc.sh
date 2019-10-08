#!/bin/bash
#$ -V
#$ -cwd
#$ -j y
#$ -o $JOB_ID_fastqc.log

echo $HOSTNAME
echo $PREFIX

OUTDIR=`pwd`

mkdir -p /scratch/aworonik/fastqc/$PREFIX
cd /scratch/aworonik/fastqc/$PREFIX

/ceph/software/fastqc/fastqc_v0.11.7/fastqc \
-t $NSLOTS \
$F $R 
 

rsync -av *html *zip $OUTDIR
