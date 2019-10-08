#!/bin/bash
#$ -V
#$ -cwd
#$ -j y
#$ -o $JOB_ID_diamond.log

echo $HOSTNAME
echo $FASTA

OUTDIR=`pwd`

source /ceph/users/lstevens/virtenv/lstevens/bin/activate

source activate blobtools_env

/ceph/software/diamond/diamond-v0.9.17/diamond blastx \
--query $FASTA \
--max-target-seqs 1 \
--sensitive \
--threads $NSLOTS \
--db /ceph/software/blast_db/diamond/uniprot_2017_12/uniprot_ref_proteomes.dmnd \
--evalue 1e-25 \
--outfmt 6 \
--out $FASTA.diamond

/ceph/software/blobtools/blobtools taxify \
-f ${FASTA}.diamond \
-m /ceph/software/blast_db/diamond/uniprot_2017_12/uniprot_ref_proteomes.taxids \
-s 0 \
-t 2
