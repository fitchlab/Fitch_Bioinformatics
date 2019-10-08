#!/bin/bash
#BATCH --verbose
#SBATCH --job-name=chr_1
#SBATCH --time=2:00:00
#SBATCH --nodes=1
#SBATCH --mem=20GB
#SBATCH --mail-type=ALL


module load samtools/intel/1.9


samtools view -b chip_1_clean_sorted_dup_rem.bam "IV" > chip_1_clean_sorted_dup_rem_chr4.bam
samtools index chip_1_clean_sorted_dup_rem_chr4.bam

samtools view -b chip_2_clean_sorted_dup_rem.bam "IV" > chip_2_clean_sorted_dup_rem_chr4.bam
samtools index chip_2_clean_sorted_dup_rem_chr4.bam

