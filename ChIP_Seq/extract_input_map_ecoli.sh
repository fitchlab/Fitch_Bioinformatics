#!/bin/bash
#BATCH --verbose
#SBATCH --job-name=bowtie
#SBATCH --time=20:00:00
#SBATCH --nodes=1
#SBATCH --mem=20GB
#SBATCH --mail-type=ALL


module load samtools/intel/1.9
module load bowtie2/intel/2.3.2


module load picard/2.17.11 

samtools view -S -b input_3_clean.sam > input_3_clean.bam
samtools sort input_3_clean.bam > input_3_clean_sorted.bam
samtools index input_3_clean_sorted.bam

java -jar /share/apps/picard/2.17.11/picard.jar MarkDuplicates \
      REMOVE_DUPLICATES= TRUE \
      I=input_3_clean_sorted.bam \
      O=input_3_clean_sorted_dup_rem.bam \
      M=input_1marked_dup_metrics.txt






#samtools view -b -f 4 input_1_clean_sorted_dup_rem.bam > unmapped_input_1_clean_sorted_dup_rem.bam
#samtools view -b -f 4 input_2_clean_sorted_dup_rem.bam > unmapped_input_2_clean_sorted_dup_rem.bam
samtools view -b -f 4 input_3_clean_sorted_dup_rem.bam > unmapped_input_3_clean_sorted_dup_rem.bam

module load bedtools/intel/2.27.1
#bedtools bamtofastq -i unmapped_input_1_clean_sorted_dup_rem.bam -fq unmapped_input_1_clean_sorted_dup_rem.fq
#bedtools bamtofastq -i unmapped_input_2_clean_sorted_dup_rem.bam -fq unmapped_input_2_clean_sorted_dup_rem.fq
bedtools bamtofastq -i unmapped_input_3_clean_sorted_dup_rem.bam -fq unmapped_input_3_clean_sorted_dup_rem.fq

#echo 'input 1'
#bowtie2 -p 8 -x /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Escherichia_coli_str_k_12_substr_mg1655.ASM584v2.dna.toplevel.fa -U /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/unmapped_input_1_clean_sorted_dup_rem.fq -S unmapped_input_1_clean_sorted_dup_rem_ecoli.sam 1>> unmapped_input_1_ecoli
#echo 'input 2'
#bowtie2 -p 8 -x /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Escherichia_coli_str_k_12_substr_mg1655.ASM584v2.dna.toplevel.fa -U /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/unmapped_input_2_clean_sorted_dup_rem.fq -S unmapped_input_2_clean_sorted_dup_rem_ecoli.sam 1>> unmapped_input_2_ecoli
echo 'input 3'
bowtie2 -p 8 -x /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Escherichia_coli_str_k_12_substr_mg1655.ASM584v2.dna.toplevel.fa -U /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/unmapped_input_3_clean_sorted_dup_rem.fq -S unmapped_input_3_clean_sorted_dup_rem_ecoli.sam 1>> unmapped_input_3_ecoli

