#!/bin/bash
#$ -V
#$ -cwd
#$ -j y
#$ -o $JOB_ID_diamond.log

echo $HOSTNAME
echo $FASTA

OUTDIR=`pwd`

# load virtenv
source /ceph/users/lstevens/virtenv/lstevens/bin/activate

# create a blobDB 
/ceph/software/blobtools/blobtools create -i $SCAFFOLD -t $BLASTN -t $DIAMOND -y spades -o $OUTPUT

# make a blobplot 
#/ceph/software/blobtools/blobtools plot -i [blobDB.json] -x bestsumorder -l 500

# make a blob table
#/ceph/software/blobtools/blobtools view -i [blobDB.json] -x bestsumorder --rank all --hits 

