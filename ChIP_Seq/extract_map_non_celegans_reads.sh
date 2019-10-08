#!/bin/bash
#BATCH --verbose
#SBATCH --job-name=bowtie
#SBATCH --time=14:00:00
#SBATCH --nodes=1
#SBATCH --mem=20GB
#SBATCH --mail-type=ALL


module load samtools/intel/1.9
module load bowtie2/intel/2.3.2

#samtools view -b -f 4 chip_1_clean_sorted_dup_rem.bam > unmapped_chip_1_clean_sorted_dup_rem.bam
#samtools view -b -f 4 chip_2_clean_sorted_dup_rem.bam > unmapped_chip_2_clean_sorted_dup_rem.bam
#samtools view -b -f 4 chip_3_clean_sorted_dup_rem.bam > unmapped_chip_3_clean_sorted_dup_rem.bam

#bowtie2-build /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Escherichia_coli_k_12.GCA_000800765.1.30.dna.toplevel.fa Escherichia_coli_k_12.GCA_000800765.1.30.dna.toplevel
#bowtie2-build /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Homo_sapiens.GRCh38.dna.toplevel.fa Homo_sapiens.GRCh38.dna.toplevel.fa
#bowtie2 -p 8 -x /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Escherichia_coli_k_12.GCA_000800765.1.30.dna.toplevel -U /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/unmapped_chip_1_clean_sorted_dup_rem.bam -S unmapped_chip_1_clean_sorted_dup_rem_ecoli.sam 2>> unmapped_chip_1_ecoli
#bowtie2 -p 8 -x /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Escherichia_coli_k_12.GCA_000800765.1.30.dna.toplevel -U /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/unmapped_chip_2_clean_sorted_dup_rem.bam -S unmapped_chip_1_clean_sorted_dup_rem_ecoli.sam 2>> unmapped_chip_2_ecoli
#bowtie2 -p 8 -x /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Escherichia_coli_k_12.GCA_000800765.1.30.dna.toplevel -U /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/unmapped_chip_3_clean_sorted_dup_rem.bam -S unmapped_chip_1_clean_sorted_dup_rem_ecoli.sam 2>> unmapped_chip_3_ecoli

#bowtie2 -p 8 -x /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Homo_sapiens.GRCh38.dna.toplevel -U /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/unmapped_chip_1_clean_sorted_dup_rem.bam -S unmapped_chip_1_clean_sorted_dup_rem_homo.sam 2>> unmapped_chip_1_homo
#bowtie2 -p 8 -x /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Homo_sapiens.GRCh38.dna.toplevel -U /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/unmapped_chip_2_clean_sorted_dup_rem.bam -S unmapped_chip_1_clean_sorted_dup_rem_homo.sam 2>> unmapped_chip_2_homo
#bowtie2 -p 8 -x /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Homo_sapiens.GRCh38.dna.toplevel -U /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/unmapped_chip_3_clean_sorted_dup_rem.bam -S unmapped_chip_1_clean_sorted_dup_rem_homo.sam 2>> unmapped_chip_3_homo


#module load bedtools/intel/2.27.1
#bedtools bamtofastq -i unmapped_chip_1_clean_sorted_dup_rem.bam -fq unmapped_chip_1_clean_sorted_dup_rem.fq
#bedtools bamtofastq -i unmapped_chip_2_clean_sorted_dup_rem.bam -fq unmapped_chip_2_clean_sorted_dup_rem.fq
#bedtools bamtofastq -i unmapped_chip_3_clean_sorted_dup_rem.bam -fq unmapped_chip_3_clean_sorted_dup_rem.fq


bowtie2 -p 8 -x /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Escherichia_coli_str_k_12_substr_mg1655.ASM584v2.dna.toplevel.fa -U /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/unmapped_chip_1_clean_sorted_dup_rem.fq -S unmapped_chip_1_clean_sorted_dup_rem_ecoli.sam 1>> unmapped_chip_1_ecoli
bowtie2 -p 8 -x /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Escherichia_coli_str_k_12_substr_mg1655.ASM584v2.dna.toplevel.fa -U /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/unmapped_chip_2_clean_sorted_dup_rem.fq -S unmapped_chip_2_clean_sorted_dup_rem_ecoli.sam 1>> unmapped_chip_2_ecoli
bowtie2 -p 8 -x /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Escherichia_coli_str_k_12_substr_mg1655.ASM584v2.dna.toplevel.fa -U /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/unmapped_chip_3_clean_sorted_dup_rem.fq -S unmapped_chip_3_clean_sorted_dup_rem_ecoli.sam 1>> unmapped_chip_3_ecoli

