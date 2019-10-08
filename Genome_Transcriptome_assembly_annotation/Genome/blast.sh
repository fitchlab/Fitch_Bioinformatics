#!/bin/bash
#$ -V
#$ -cwd
#$ -j y
#$ -o $JOB_ID_blast.log

echo $HOSTNAME
echo $FASTA

export PATH=/ceph/software/conda/bin/:$PATH
source activate main_env


blastn \
-task megablast \
-query $FASTA \
-db /ceph/software/databases/ncbi_2018_02/full/nt \
-outfmt '6 qseqid staxids bitscore std' \
-max_target_seqs 1 \
-max_hsps 1 \
-num_threads $NSLOTS \
-evalue 1e-25 \
-out ${FASTA}.blastn


