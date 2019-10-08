#!/bin/bash

#BATCH --verbose
#SBATCH --job-name=chip
#SBATCH --time=15:00:00
#SBATCH --nodes=1
#SBATCH --mem=20GB
#SBATCH --mail-type=ALL



WORKING_DIR=$(pwd)
mkdir forUCSC

cp MACSoutput/*peaks.bed MACSoutput/*peaks_final.bed InputSubtCoverage/*bw RatioCoverage/*bw forUCSC

cd forUCSC




ls *bed > files.txt
n="$(wc -l files.txt | awk '{print $1}')"

echo "Converting bed to bigbed..."
job_out=$(sbatch --output=$WORKING_DIR/reports/slurm_getBWBB_%j.out\
                --error=$WORKING_DIR/reports/slurm_getBWBB_%j.err\
                --mail-type=ALL\
                --mail-user=$MAIL\
                --array=1-$n\
                /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/trackhub_scripts/doGetBWBB_v2.s)

wait_for_job "$job_out"
echo "Converting bed to bb finished"

rm *.bed files.txt

mkdir averages single_replicates
mv *avg* $WORKING_DIR/forUCSC.txt averages
mv *bb *bw single_replicates

#Report time
end=$(date +"%T")
echo "ChIP pipeline finishes at: $end"

