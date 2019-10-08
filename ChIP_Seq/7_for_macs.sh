#!/bin/bash

#BATCH --verbose
#SBATCH --job-name=chip
#SBATCH --time=15:00:00
#SBATCH --nodes=1
#SBATCH --mem=20GB
#SBATCH --mail-type=ALL


#Time
start=$(date +"%T")
echo "ChIP pipeline starts at: $start"

export WORKING_DIR=$(pwd)
export YAML_CONFIG=$WORKING_DIR/config_v1.yaml
export MAIL=$(egrep 'mail:' $YAML_CONFIG | awk '!/^#/ && $0=$2')
export NYUID=$(egrep 'nyuid:' $YAML_CONFIG | awk '!/^#/ && $0=$2')
export SBATCH_SCRIPTS=$(pwd)
export GENE_TSS_ANNOT=$(egrep 'gene_tss_annot:' $YAML_CONFIG | awk '!/^#/ && $0=$2')
WORKING_DIR=$(pwd)
metadata_dir=$WORKING_DIR/metadata_dir
forMacs=$WORKING_DIR/forMacs.txt


# because we're running this job in parallel it's important to create
# this directory here to avoid errors
mkdir -p MACSoutput

#Count how many files we will calculate MACs peaks for
n=$(wc -l forMacs.txt | awk '$0=$1')

#Run MACS to identify peaks of ChIP enrichment
echo "Running MACS..."
job_out=$(sbatch --output=$WORKING_DIR/reports/slurm_MACS2_%j.out\
                 --error=$WORKING_DIR/reports/slurm_MACS2_%j.err\
                 --mail-type=ALL\
                 --mail-user=$MAIL\
                 --array=1-$n\
                 $SBATCH_SCRIPTS/doMACS2.s)
