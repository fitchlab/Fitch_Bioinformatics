#!/bin/bash
#BATCH --verbose
#SBATCH --job-name=rem_dup
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --mem=20GB
#SBATCH --mail-type=ALL

#module load samtools/intel/1.9

#samtools view -S -b chip_1_clean.sam > chip_1_clean_unsorted.bam
#samtools view -S -b chip_2_clean.sam > chip_2_clean_unsorted.bam
#samtools view -S -b chip_3_clean.sam > chip_3_clean_unsorted.bam


module load samtools/intel/1.9
module load picard/2.17.11 

#samtools sort chip_1_clean_unsorted.bam > chip_1_clean_sorted.bam
#samtools sort chip_2_clean_unsorted.bam > chip_2_clean_sorted.bam
#samtools sort chip_3_clean_unsorted.bam > chip_3_clean_sorted.bam



#java -jar /share/apps/picard/2.17.11/picard.jar MarkDuplicates \
#      REMOVE_DUPLICATES= TRUE \
#      I=chip_1_clean_sorted.bam \
#      O=chip_1_clean_sorted_dup_rem.bam \
#      M=chip_1marked_dup_metrics.txt

#java -jar /share/apps/picard/2.17.11/picard.jar MarkDuplicates \
#      REMOVE_DUPLICATES= TRUE \
#      I=chip_2_clean_sorted.bam \
#      O=chip_2_clean_sorted_dup_rem.bam \
#      M=chip_2marked_dup_metrics.txt

#java -jar /share/apps/picard/2.17.11/picard.jar MarkDuplicates \
#      REMOVE_DUPLICATES= TRUE \
#      I=chip_3_clean_sorted.bam \
#      O=chip_3_clean_sorted_dup_rem.bam \
#      M=chip_3marked_dup_metrics.txt


#samtools index chip_3_clean_sorted_dup_rem.bam
#samtools index chip_1_clean_sorted_dup_rem.bam
#samtools index chip_2_clean_sorted_dup_rem.bam

#module load samtools/intel/1.9

#samtools view -S -b input_1_clean.sam > input_1_clean_unsorted.bam
#samtools view -S -b input_2_clean.sam > input_2_clean_unsorted.bam


samtools view -b input_1_clean_sorted_dup_rem.bam "IV" > input_1_clean_sorted_dup_rem_chr4.bam
samtools index input_1_clean_sorted_dup_rem_chr4.bam

samtools view -b input_2_clean_sorted_dup_rem.bam "IV" > input_2_clean_sorted_dup_rem_chr4.bam
samtools index input_2_clean_sorted_dup_rem_chr4.bam


module load samtools/intel/1.9
module load picard/2.17.11 

samtools sort input_1_clean_unsorted.bam > input_1_clean_sorted.bam
samtools sort input_2_clean_unsorted.bam > input_2_clean_sorted.bam



java -jar /share/apps/picard/2.17.11/picard.jar MarkDuplicates \
      REMOVE_DUPLICATES= TRUE \
      I=input_1_clean_sorted.bam \
      O=input_1_clean_sorted_dup_rem.bam \
      M=input_1marked_dup_metrics.txt

java -jar /share/apps/picard/2.17.11/picard.jar MarkDuplicates \
      REMOVE_DUPLICATES= TRUE \
      I=input_2_clean_sorted.bam \
      O=input_2_clean_sorted_dup_rem.bam \
      M=input_2marked_dup_metrics.txt


samtools index input_1_clean_sorted_dup_rem.bam
samtools index input_2_clean_sorted_dup_rem.bam



