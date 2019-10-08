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
/ceph/software/CGP-scripts/scripts/fastaqual_select.pl -f /data/projects/caenorhabditis/analyses/alyssa/$PREFIX_spades/scaffolds.fasta -l 200 > $PREFIX_spades_scaf_greater_200.fasta
rsync -av $PREFIX_spades_scaf_greater_200.fasta $OUTDIR

