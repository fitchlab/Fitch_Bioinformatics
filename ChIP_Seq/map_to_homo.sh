#!/bin/bash
#BATCH --verbose
#SBATCH --job-name=homo_bowtie
#SBATCH --time=14:00:00
#SBATCH --nodes=1
#SBATCH --mem=20GB
#SBATCH --mail-type=ALL
module load bowtie2/intel/2.3.2
module load pigz/intel/2.3.4  
#unpigz Homo_sapiens.GRCh38.dna.toplevel.fa.gz
#bowtie2-build Homo_sapiens.GRCh38.dna.toplevel.fa Homo_sapiens.GRCh38.dna.toplevel.fa
#bowtie2 -p 8 -x /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Homo_sapiens.GRCh38.dna.toplevel.fa -U /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/unmapped_chip_1_clean_sorted_dup_rem.fq -S unmapped_chip_1_clean_sorted_dup_rem_homo.sam 1>> unmapped_chip_1_homo
#bowtie2 -p 8 -x /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Homo_sapiens.GRCh38.dna.toplevel.fa -U /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/unmapped_chip_2_clean_sorted_dup_rem.fq -S unmapped_chip_2_clean_sorted_dup_rem_homo.sam 1>> unmapped_chip_2_homo
#bowtie2 -p 8 -x /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Homo_sapiens.GRCh38.dna.toplevel.fa -U /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/unmapped_chip_3_clean_sorted_dup_rem.fq -S unmapped_chip_3_clean_sorted_dup_rem_homo.sam 1>> unmapped_chip_3_homo


#bowtie2 -p 8 -x /scratch/work/cgsb/genomes/Public/Vertebrate_mammalian/Homo_sapiens/Ensembl/GRCh38.p10/Homo_sapiens.GRCh38.dna.toplevel -U /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/unmapped_chip_1_clean_sorted_dup_rem.fq -S unmapped_chip_1_clean_sorted_dup_rem_homo.sam 1>> unmapped_chip_1_homo
#bowtie2 -p 8 -x /scratch/work/cgsb/genomes/Public/Vertebrate_mammalian/Homo_sapiens/Ensembl/GRCh38.p10/Homo_sapiens.GRCh38.dna.toplevel -U /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/unmapped_chip_2_clean_sorted_dup_rem.fq -S unmapped_chip_2_clean_sorted_dup_rem_homo.sam 1>> unmapped_chip_2_homo
#bowtie2 -p 8 -x /scratch/work/cgsb/genomes/Public/Vertebrate_mammalian/Homo_sapiens/Ensembl/GRCh38.p10/Homo_sapiens.GRCh38.dna.toplevel -U /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/unmapped_chip_3_clean_sorted_dup_rem.fq -S unmapped_chip_3_clean_sorted_dup_rem_homo.sam 1>> unmapped_chip_3_homo


echo 'input 1 to homo'
bowtie2 -p 8 -x /scratch/work/cgsb/genomes/Public/Vertebrate_mammalian/Homo_sapiens/Ensembl/GRCh38.p10/Homo_sapiens.GRCh38.dna.toplevel -U /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/unmapped_input_1_clean_sorted_dup_rem.fq -S unmapped_input_1_clean_sorted_dup_rem_homo.sam 1>> unmapped_homo_1_homo
echo 'input 2 to homo'
bowtie2 -p 8 -x /scratch/work/cgsb/genomes/Public/Vertebrate_mammalian/Homo_sapiens/Ensembl/GRCh38.p10/Homo_sapiens.GRCh38.dna.toplevel -U /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/unmapped_input_2_clean_sorted_dup_rem.fq -S unmapped_input_2_clean_sorted_dup_rem_homo.sam 1>> unmapped_homo_2_homo
echo 'input 3 to homo'
bowtie2 -p 8 -x /scratch/work/cgsb/genomes/Public/Vertebrate_mammalian/Homo_sapiens/Ensembl/GRCh38.p10/Homo_sapiens.GRCh38.dna.toplevel -U /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/unmapped_input_3_clean_sorted_dup_rem.fq -S unmapped_input_3_clean_sorted_dup_rem_homo.sam 1>> unmapped_homo_3_homo

