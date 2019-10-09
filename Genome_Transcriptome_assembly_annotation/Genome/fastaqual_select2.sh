#!/bin/bash
#$ -V
#$ -cwd
#$ -j y
#$ -o $JOB_ID_fastqc.log

echo $HOSTNAME
echo $PREFIX

OUTDIR=`pwd`

mkdir -p /scratch/aworonik/fastaqual_select/$PREFIX
cd /scratch/aworonik/fastaqual_select/$PREFIX
/ceph/software/CGP-scripts/scripts/fastaqual_select.pl -f /data/projects/caenorhabditis/analyses/alyssa/$PREFIX.spades2/scaffolds.fasta -l 200 > $PREFIX.spades2_scaf_greater_200.fasta
rsync -av $PREFIX.spades2_scaf_greater_200.fasta $OUTDIR

