#!/bin/bash
#$ -V
#$ -cwd
#$ -j y
#$ -o $JOB_ID_busco.log

export AUGUSTUS_CONFIG_PATH=/ceph/software/augustus/augustus-3.3.1/config/species/caenorhabditis
run_busco \
-i $FASTA \
-m geno \
-c $NSLOTS \
-l /ceph/software/busco_dbs/nematoda_odb9 \
--out ${PREFIX}_proteome
