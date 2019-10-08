#!/bin/sh
#BATCH --verbose
#SBATCH --job-name=homer
#SBATCH --time=10:00:00
#SBATCH --nodes=1
#SBATCH --mem=20GB

module load homer/intel/4.10.1
#findMotifsGenome.pl /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/MACSoutput/chip_1_clean_peaks.bed /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Caenorhabditis_elegans.WBcel235.dna.toplevel.fa peakAnalysischip1 -size 200 
#findMotifsGenome.pl /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/MACSoutput/chip_2_clean_peaks.bed /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Caenorhabditis_elegans.WBcel235.dna.toplevel.fa peakAnalysischip2 -size 200 
#findMotifsGenome.pl /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/MACSoutput/DMD3_L4_DF301_avg_C1_C2_chip_peaks_final.bed /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Caenorhabditis_elegans.WBcel235.dna.toplevel.fa peakAnalysismergechip12 -size 200 



#findMotifsGenome.pl /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/MACSoutput/clean_chip_1_top_100_peaks.bed /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Caenorhabditis_elegans.WBcel235.dna.toplevel.fa peakAnalysistio_100_peaks_Chip1 -size 200 
#findMotifsGenome.pl /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/MACSoutput/clean_chip_2_top_100_peaks.bed /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Caenorhabditis_elegans.WBcel235.dna.toplevel.fa peakAnalysistio_100_peaks_Chip2 -size 200 
#findMotifsGenome.pl /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/MACSoutput/clean_chip_12_top_100_peaks.bed /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Caenorhabditis_elegans.WBcel235.dna.toplevel.fa peakAnalysistio_100_peaks_Chip12 -size 200 
#findMotifsGenome.pl /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/MACSoutput/DMD3_L4_DF301_avg_C1_C2_chip_peaks_final_top_100_peaks.bed /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Caenorhabditis_elegans.WBcel235.dna.toplevel.fa peakAnalysistio_100_peaks_Chip12 -size 200 

#scanMotifGenomeWide.pl /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/GTGTCCCCGC.motif /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Caenorhabditis_elegans.WBcel235.dna.toplevel.fa -bed > GTGTCCCCGC_WBcel235.bed

scanMotifGenomeWide.pl /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Narasimhan_DMD_3.motif /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Caenorhabditis_elegans.WBcel235.dna.toplevel.fa -bed > Narasimhan_DMD_3.motif_WBcel235.bed

#findMotifsGenome.pl /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/MACSoutput/clean_chip_1_top_100_peaks.bed /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Caenorhabditis_elegans.WBcel235.dna.toplevel.fa size_50_peakAnalysistio_100_peaks_Chip1 -size 50 
#findMotifsGenome.pl /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/MACSoutput/clean_chip_2_top_100_peaks.bed /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Caenorhabditis_elegans.WBcel235.dna.toplevel.fa size_50_peakAnalysistio_100_peaks_Chip2 -size 50 
#findMotifsGenome.pl /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/MACSoutput/DMD3_L4_DF301_avg_C1_C2_chip_peaks_final_top_100_peaks.bed /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Caenorhabditis_elegans.WBcel235.dna.toplevel.fa size_50_peakAnalysistio_100_peaks_Chip12 -size 50 

#findMotifsGenome.pl /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/MACSoutput/clean_chip_1_top_100_peaks.bed /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Caenorhabditis_elegans.WBcel235.dna.toplevel.fa size_given_peakAnalysistio_100_peaks_Chip1 -size given 
#findMotifsGenome.pl /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/MACSoutput/clean_chip_2_top_100_peaks.bed /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Caenorhabditis_elegans.WBcel235.dna.toplevel.fa size_given_peakAnalysistio_100_peaks_Chip2 -size given 
#findMotifsGenome.pl /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/MACSoutput/DMD3_L4_DF301_avg_C1_C2_chip_peaks_final_top_100_peaks.bed /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Caenorhabditis_elegans.WBcel235.dna.toplevel.fa size_given_peakAnalysistio_100_peaks_Chip12 -size given 

