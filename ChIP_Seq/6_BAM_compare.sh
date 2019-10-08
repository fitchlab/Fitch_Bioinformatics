#!/bin/bash

#BATCH --verbose
#SBATCH --job-name=chip
#SBATCH --time=15:00:00
#SBATCH --nodes=1
#SBATCH --mem=20GB
#SBATCH --mail-type=ALL


export WORKING_DIR=$(pwd)
export YAML_CONFIG=$WORKING_DIR/config_v1.yaml
export MAIL=$(egrep 'mail:' $YAML_CONFIG | awk '!/^#/ && $0=$2')
export NYUID=$(egrep 'nyuid:' $YAML_CONFIG | awk '!/^#/ && $0=$2')
export SBATCH_SCRIPTS=$(pwd)
export GENE_TSS_ANNOT=$(egrep 'gene_tss_annot:' $YAML_CONFIG | awk '!/^#/ && $0=$2')
WORKING_DIR=$(pwd)
metadata_dir=$WORKING_DIR/metadata_dir
ercan_chip="/scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src"

cd $WORKING_DIR



# create input file for bamCompare script
forBamCompare=forBamCompare.txt
cat $metadata_dir/paired_*.txt > $forBamCompare

cp forBamCompare.txt $WORKING_DIR/BAM/
cd $WORKING_DIR

# Define and count how many merged BAM files there are
n=$(wc -l $forBamCompare | awk '$0=$1')

# Bam compare is used to get coverage bedgraphs of input and ChIP, along with input subtracted and ratio bigwigs
echo "Running bamCompare..."
#job_out=$(sbatch --output=$WORKING_DIR/reports/slurm_bamCompare_%j.out\
#                 --mail-type=ALL\
#                 --mail-user=$MAIL\
#                 --array=1-$n\
#                 $SBATCH_SCRIPTS/bamCompare.s)

wait_for_job "$job_out"
echo "bamCompare finished..."

# clean-up to remove the input metadadta
#rm $forBamCompare
cd $WORKING_DIR
# organize. output files are saved into specific directories
mkdir -p InputSubtCoverage RatioCoverage RawInputCoverage RawChipCoverage
mv *chip.SeqDepthNorm.bdg RawChipCoverage
mv *input.SeqDepthNorm.bdg RawInputCoverage
mv *_inputsubt.bw InputSubtCoverage
mv *_ratio.bw RatioCoverage
mv InputSubtCoverage RatioCoverage RawInputCoverage RawChipCoverage MedianCoverage $WORKING_DIR

cd $WORKING_DIR

# Record keeping. Create a copy of files that we want to save into lab scratch so it will be archived
cp InputSubtCoverage/* $ercan_chip/ChIPseq_INSubt
cp RatioCoverage/* $ercan_chip/ChIPseq_RatioCoverage
cp MedianCoverage/* $ercan_chip/ChIPseq_MedianCoverage

