#!/bin/bash
#
#BATCH --verbose
#SBATCH --job-name=trim_adapt
#SBATCH --time=01:00:00
#SBATCH --nodes=1
#SBATCH --mem=20GB
module load bbmap/38.42

#These calls were taken from this manual https://jgi.doe.gov/data-and-tools/bbtools/bb-tools-user-guide/bbduk-guide/

#filter for sequencing adaptors
#bbduk.sh in=DMD3_DF301_L4_ext1_S1_input_S1i.fastq out=DMD3_DF301_L4_ext1_S1_input_S1i_trim.fastq ref=/scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/seq_adaptors.fa ktrim=r k=23 mink=11 hdist=1 tpe tbo
#bbduk.sh in=DMD3_DF301_L4_ext2_S2_input_S2i.fastq out=DMD3_DF301_L4_ext2_S2_input_S2i_trim.fastq ref=/scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/seq_adaptors.fa ktrim=r k=23 mink=11 hdist=1 tpe tbo
#bbduk.sh in=DMD3_DF301_L4_ext3_S3_input_S3i.fastq out=DMD3_DF301_L4_ext3_S3_input_S3i_trim.fastq ref=/scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/seq_adaptors.fa ktrim=r k=23 mink=11 hdist=1 tpe tbo
#bbduk.sh in=input_S1i_DF301_L4_ext1.fastq out=input_S1i_DF301_L4_ext1_trim.fastq ref=/scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/seq_adaptors.fa ktrim=r k=23 mink=11 hdist=1 tpe tbo
#bbduk.sh in=input_S2i_DF301_L4_ext2.fastq out=input_S2i_DF301_L4_ext2_trim.fastq ref=/scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/seq_adaptors.fa ktrim=r k=23 mink=11 hdist=1 tpe tbo
#bbduk.sh in=input_S3i_DF301_L4_ext3.fastq out=input_S3i_DF301_L4_ext3_trim.fastq ref=/scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/seq_adaptors.fa ktrim=r k=23 mink=11 hdist=1 tpe tbo

#Archive raw fastq
#mkdir raw_fastq
#mv *i.fastq raw_fastq/
#mv input_S*i_*.fastq raw_fastq/

#filter for read quality

#bbduk.sh in=DMD3_DF301_L4_ext1_S1_input_S1i_trim.fastq out=chip_1_clean.fq qtrim=r trimq=10 maq=10
#bbduk.sh in=DMD3_DF301_L4_ext2_S2_input_S2i_trim.fastq out=chip_2_clean.fq qtrim=r trimq=10 maq=10
#bbduk.sh in=DMD3_DF301_L4_ext3_S3_input_S3i_trim.fastq out=chip_3_clean.fq qtrim=r trimq=10 maq=10
#bbduk.sh in=input_S1i_DF301_L4_ext1_trim.fastq out=input_1_clean.fq qtrim=r trimq=10 maq=10
#bbduk.sh in=input_S2i_DF301_L4_ext2_trim.fastq out=input_2_clean.fq qtrim=r trimq=10 maq=10
#bbduk.sh in=input_S3i_DF301_L4_ext3_trim.fastq out=input_3_clean.fq qtrim=r trimq=10 maq=10

#rm *_trim.fastq

#Asses the difference between raw reads and cleaned reads

module load fastqc/0.11.7
module load multiqc/intel/1.5 

#cleaned reads
#fastqc -o fastqc_clean chip_1_clean.fq chip_2_clean.fq chip_3_clean.fq input_1_clean.fq input_2_clean.fq input_3_clean.fq
#fastqc -o fastqc_clean input_1_clean.fq input_2_clean.fq input_3_clean.fq
#multiqc /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/fastqc_clean

#mkdir /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/fastqc_raw
cd /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/raw_fastq

#fastqc -o /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/fastqc_raw *fastq
multiqc /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/fastqc_raw

