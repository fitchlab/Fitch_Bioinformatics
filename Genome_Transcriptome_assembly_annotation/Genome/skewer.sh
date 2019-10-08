#!/bin/bash
#$ -V
#$ -cwd
#$ -j y
#$ -o $JOB_ID_skewer.log

echo $HOSTNAME
echo $PREFIX

OUTDIR=`pwd`

mkdir -p /scratch/aworonik/skewer/$PREFIX
cd /scratch/aworonik/skewer/$PREFIX

/ceph/software/skewer/skewer-0.2.2/skewer \
-y /data/projects/caenorhabditis/analyses/new_data_dec17/1_prior_to_assembly/scripts/TruSeq3-SE.ALL.fa \
-n \
-q 30 \
-l 76 \
-m any \
-o $PREFIX \
-t $NSLOTS \
$F \
$R

pigz -p $NSLOTS ${PREFIX}*.fastq

rsync -av *.fastq.gz $OUTDIR

rm *.fastq.gz
