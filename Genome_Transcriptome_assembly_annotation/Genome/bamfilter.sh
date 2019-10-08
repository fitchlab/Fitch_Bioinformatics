#!/bin/bash
#$ -V
#$ -cwd
#$ -j y
#$ -o $JOB_ID_bowtie_ecoli.log

export PATH=/ceph/software/conda/bin/:$PATH
source activate main_env
source /ceph/users/lstevens/virtenv/lstevens/bin/activate

echo $HOSTNAME
echo $PREFIX

OUTDIR=`pwd`

mkdir -p /scratch/aworonik/bamfilter/$PREFIX
cd /scratch/aworonik/bamfilter/$PREFIX

samtools view -Sb $PREFIX.sam > $PREFIX.bam

/ceph/software/blobtools/blobtools bamfilter \
-b $PREFIX.bam \
-o $PREFIX \
-u \
--sort \
--keep \ 

rsync -av * $OUTDIR
