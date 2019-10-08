#!/bin/bash
# Create the input file for the merging script
WORKING_DIR=$(pwd)
echo "working dir $WORKING_DIR"
forMacs=$WORKING_DIR/forMacs.txt
echo " forMacs $forMacs"
metadata_dir=$WORKING_DIR/metadata_dir
echo "$metadata_dir"
forMerge=$WORKING_DIR/BAM/forMerge.txt
ercan_chip="/scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src"

YAML_CONFIG=$WORKING_DIR/config_v1.yaml
MAIL=$(egrep 'mail:' $YAML_CONFIG | awk '!/^#/ && $0=$2')
NYUID=$(egrep 'nyuid:' $YAML_CONFIG | awk '!/^#/ && $0=$2')
SBATCH_SCRIPTS=$(pwd)
GENE_TSS_ANNOT=$(egrep 'gene_tss_annot:' $YAML_CONFIG | awk '!/^#/ && $0=$2')

# sort and index merged bams

# Define and count how many merged BAM files there are
tail -q -n 1 $metadata_dir/paired_* | sed 's/[[:space:]]/.bam\n/g' | sed '2~2d' > forSort.txt
n=$(wc -l forSort.txt | awk '$0=$1')

#Merged BAM files are sorted and indexed
echo "Sorting and indexing merged BAM files..."
job_out=$(sbatch --output=$WORKING_DIR/reports/slurm_sortBam_%j.out\
                --error=$WORKING_DIR/reports/slurm_sortBam_%j.err\
                --mail-type=ALL\
                --mail-user=$MAIL\
                --array=1-$n\
                $SBATCH_SCRIPTS/sortBam_formerge.s)
wait_for_job "$job_out"

mkdir $ercan_chip/ChIPseq_bamfiles/
# Record keeping. Put merged BAMs in one place
cp *bam $ercan_chip/ChIPseq_bamfiles/
