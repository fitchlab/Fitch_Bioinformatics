#!/bin/bash

#BATCH --verbose
#SBATCH --job-name=chip
#SBATCH --time=15:00:00
#SBATCH --nodes=1
#SBATCH --mem=20GB
#SBATCH --mail-type=ALL


WORKING_DIR=$(pwd)


cd $WORKING_DIR/MACSoutput/


ls $WORKING_DIR/MACSoutput/*bed > $WORKING_DIR/MACSoutput/files.txt


