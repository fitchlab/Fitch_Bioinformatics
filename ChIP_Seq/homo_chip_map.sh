#!/bin/bash
#BATCH --verbose
#SBATCH --job-name=homo_bowtie
#SBATCH --time=14:00:00
#SBATCH --nodes=1
#SBATCH --mem=40GB
#SBATCH --mail-type=ALL
module load bowtie2/intel/2.3.2
module load pigz/intel/2.3.4  
bowtie2-build Homo_sapiens.GRCh38.dna.toplevel.fa Homo_sapiens.GRCh38.dna.toplevel.fa
#bowtie2 -p 8 -x /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Homo_sapiens.GRCh38.dna.toplevel.fa -U /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/unmapped_chip_1_clean_sorted_dup_rem.fq -S unmapped_chip_1_clean_sorted_dup_rem_homo.sam 1>> unmapped_chip_1_homo
#bowtie2 -p 8 -x /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Homo_sapiens.GRCh38.dna.toplevel.fa -U /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/unmapped_chip_2_clean_sorted_dup_rem.fq -S unmapped_chip_2_clean_sorted_dup_rem_homo.sam 1>> unmapped_chip_2_homo
#bowtie2 -p 8 -x /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Homo_sapiens.GRCh38.dna.toplevel.fa -U /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/unmapped_chip_3_clean_sorted_dup_rem.fq -S unmapped_chip_3_clean_sorted_dup_rem_homo.sam 1>> unmapped_chip_3_homo

