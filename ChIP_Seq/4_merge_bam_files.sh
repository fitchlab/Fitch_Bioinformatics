#!/bin/bash
# Create the input file for the merging script
WORKING_DIR=$(pwd)
echo "working dir $WORKING_DIR"
forMacs=$WORKING_DIR/forMacs.txt
echo " forMacs $forMacs"
metadata_dir=$WORKING_DIR/metadata_dir
echo "$metadata_dir"
forMerge=$WORKING_DIR/BAM/forMerge.txt

YAML_CONFIG=$WORKING_DIR/config_v1.yaml
MAIL=$(egrep 'mail:' $YAML_CONFIG | awk '!/^#/ && $0=$2')
NYUID=$(egrep 'nyuid:' $YAML_CONFIG | awk '!/^#/ && $0=$2')
SBATCH_SCRIPTS=$(pwd)
GENE_TSS_ANNOT=$(egrep 'gene_tss_annot:' $YAML_CONFIG | awk '!/^#/ && $0=$2')

# Count how many BAMs mergers required using merger input file
n=$(wc -l $forMerge | awk '$0=$1')
echo "Merging BAM files..."

#BAM files are merged if they are replicates using samtools
job_out=$(sbatch --output=$WORKING_DIR/reports/slurm_mergeBam_%j.out\
                --error=$WORKING_DIR/reports/slurm_mergeBam_%j.err\
                --mail-type=ALL\
                --mail-user=$MAIL\
                --array=1-$n\
                $SBATCH_SCRIPTS/mergeBam.s)

wait_for_job "$job_out"

