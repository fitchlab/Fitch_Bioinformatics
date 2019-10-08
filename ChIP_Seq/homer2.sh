#!/bin/sh
#BATCH --verbose
#SBATCH --job-name=homer2
#SBATCH --time=10:00:00
#SBATCH --nodes=1
#SBATCH --mem=20GB

module load homer/intel/4.10.1

#cd /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/peakAnalysistio_100_peaks_Chip1
#findMotifsGenome.pl /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/MACSoutput/clean_chip_1_top_100_peaks.bed /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Caenorhabditis_elegans.WBcel235.dna.toplevel.fa find_GTGTCCCCGC_chip1 -find /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/GTGTCCCCGC.motif > GTGTCCCCGC.motif_chip1
#cd /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/peakAnalysistio_100_peaks_Chip2
#findMotifsGenome.pl /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/MACSoutput/clean_chip_2_top_100_peaks.bed /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Caenorhabditis_elegans.WBcel235.dna.toplevel.fa find_GTGTCCCCGC_chip2 -find /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/GTGTCCCCGC.motif > GTGTCCCCGC.motif_chip1
#cd /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/peakAnalysistio_100_peaks_Chip12
#findMotifsGenome.pl /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/MACSoutput/DMD3_L4_DF301_avg_C1_C2_chip_peaks_final_top_100_peaks.bed /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Caenorhabditis_elegans.WBcel235.dna.toplevel.fa find_GTGTCCCCGC_chip12 -find /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/GTGTCCCCGC.motif > GTGTCCCCGC.motif_chip1 

#cd /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/peakAnalysistio_100_peaks_Chip12
#findMotifsGenome.pl /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/MACSoutput/DMD3_L4_DF301_avg_C1_C2_chip_peaks_final.bed /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Caenorhabditis_elegans.WBcel235.dna.toplevel.fa find_GTGTCCCCGC_chip1 -find /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/GTGTCCCCGC.motif > GTGTCCCCGC.motif_DMD3_L4_DF301_avg_C1_C2_chip_peaks_final.bed

#cd /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/peakAnalysistio_100_peaks_Chip1
#findMotifsGenome.pl /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/MACSoutput/DMD3_L4_DF301_avg_C1_C2_chip_peaks_final.bed /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Caenorhabditis_elegans.WBcel235.dna.toplevel.fa TKWRTAYTCART -find /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/peakAnalysistio_100_peaks_Chip12/TKWRTAYTCART.motif > TKWRTAYTCART.motif_DMD3_L4_DF301_avg_C1_C2_chip_peaks_final.bed

