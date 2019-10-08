#!/bin/bash

#BATCH --verbose
#SBATCH --job-name=chip
#SBATCH --time=15:00:00
#SBATCH --nodes=1
#SBATCH --mem=20GB
#SBATCH --mail-type=ALL

n=$(wc -l forMacs.txt | awk '$0=$1')
export SBATCH_SCRIPTS=$(pwd)
WORKING_DIR=$(pwd)
cd $WORKING_DIR/MACSoutput/
ls *bed > files.txt

echo "bedClip to remove lines not in the limits of the chromosome annotation..."
job_out=$(sbatch --output=$WORKING_DIR/reports/slurm_clipBeds_%j.out\
                --error=$WORKING_DIR/reports/slurm_clipBeds_%j.err\
                --mail-type=ALL\
                --mail-user=$MAIL\
                --array=1-$n\
                $SBATCH_SCRIPTS/clipBeds.s)

wait_for_job "$job_out"
echo "bedClip finished..."


