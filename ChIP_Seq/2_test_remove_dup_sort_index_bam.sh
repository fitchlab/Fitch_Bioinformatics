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


############### Remove duplicates, sort and index bam files

#List and count many BAMs in the directory
cd $WORKING_DIR/BAM
ls *.bam > forSort.txt
n=$(wc -l forSort.txt | awk '$0=$1')

#Duplicate reads are removed using MACS. The bedfile output is converted back to BAM for
#subsequent steps. BAM files are then sorted and indexed using sam tools, to allow further
#processing of bam files downstream
echo "Sorting and indexing BAM files..."
job_out=$(sbatch --output=$WORKING_DIR/reports/slurm_sortBam_%j.out\
                --error=$WORKING_DIR/reports/slurm_sortBam_%j.err\
                --mail-type=ALL\
                --mail-user=$MAIL\
                --array=1-$n\
                $SBATCH_SCRIPTS/sortBam.s)

wait_for_job "$job_out"


