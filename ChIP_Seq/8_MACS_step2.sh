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


cd $WORKING_DIR/MACSoutput

# change the extension of the peak files
for file in *.narrowPeak; do
  mv "$file" "${file%.narrowPeak}".bed
done

# make the input file for overlapping peaks
forOverlappingPeaks=$WORKING_DIR/MACSoutput/forOverlappingPeaks.txt
for sample_file in $metadata_dir/paired_*.txt; do
  cat -n $sample_file | sort -nr | awk -- 'ENDFILE {printf "\n"} {printf "%s_peaks.bed ",$2}' >> $forOverlappingPeaks
done

pwd

$forOverlappingPeaks

# get overlapping peaks
n=$(wc -l $forOverlappingPeaks | awk '$0=$1')

echo "Running Overlapping peaks job..."
job_out=$(sbatch --output=$WORKING_DIR/reports/slurm_overlapping_peaks_%j.out\
                 --error=$WORKING_DIR/reports/slurm_overlapping_peaks_%j.err\
                 --mail-type=ALL\
                 --mail-user=$MAIL\
                 --array=1-$n\
                 $SBATCH_SCRIPTS/getOverlappingPeaks.s)

wait_for_job "$job_out"
echo "Overlapping peaks finished..."


