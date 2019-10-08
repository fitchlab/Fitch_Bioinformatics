#!/bin/bash
#BATCH --verbose
#SBATCH --job-name=bedtools_close
#SBATCH --time=2:00:00
#SBATCH --nodes=1
#SBATCH --mem=20GB
#SBATCH --mail-type=ALL

module load bedtools/intel/2.27.1 

#Find the closest TSS to all places in the genome where the "DMD-3 motif" was identified
#bedtools sort -i GTGTCCCCGC_WBcel235.bed > GTGTCCCCGC_WBcel235_sorted.bed
#bedtools sort -i TSS_WBcel235.bed > TSS_WBcel235_sorted.bed
#bedtools closest -D a -a /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/GTGTCCCCGC_WBcel235_sorted.bed -b /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/TSS_WBcel235_sorted.bed > closest_peak_TSS_chip_peak.bed


#How many of the ChIP Seq peaks overlap with the places where Homer scanMotifGenomeWide.pl found the motif - should be the majority of peaks that have the motif
#bedtools intersect -wa -a /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/MACSoutput/chip_1_clean_peaks.bed -b /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/GTGTCCCCGC_WBcel235_sorted.bed > Intersect_Chip_1_peaks_dmd3_motif.bed
#bedtools intersect -wa -a /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/MACSoutput/chip_2_clean_peaks.bed -b /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/GTGTCCCCGC_WBcel235_sorted.bed > Intersect_Chip_2_peaks_dmd3_motif.bed
#bedtools intersect -wa -a /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/MACSoutput/DMD3_L4_DF301_avg_C1_C2_chip_peaks_final.bed -b /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/GTGTCCCCGC_WBcel235_sorted.bed > Intersect_avg_C1_C2_peaks_dmd3_motif.bed


#How many of the peaks that overlap with motifs are common amongs the replicates
#bedtools intersect -wa -a Intersect_Chip_1_peaks_dmd3_motif.bed -b Intersect_Chip_2_peaks_dmd3_motif.bed > common_peaks_with_motifs


#bedtools intersect -wa -wb -a test.bed -b Intersect_Chip_2_peaks_dmd3_motif.bed> testoutput

#There are 49 peaks in common between chip 1 and chip 2 what are the nearest TSS?

#bedtools sort -i common_peaks_with_motifs.bed > common_peaks_with_motifs_sorted.bed
#bedtools closest -D a -a /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/common_peaks_with_motifs_sorted.bed -b /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/TSS_WBcel235_sorted.bed > common_peaks_closest_TSS.bed_test


#bedtools sort -i /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/MACSoutput/DMD3_L4_DF301_avg_C1_C2_chip_peaks_final.bed > DMD3_L4_DF301_avg_C1_C2_chip_peaks_final_sort.bed
#bedtools closest -D a -a /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/MACSoutput/DMD3_L4_DF301_avg_C1_C2_chip_peaks_final_sort.bed -b /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/TSS_WBcel235_sorted.bed > DMD3_L4_DF301_avg_C1_C2_chip_peaks_final_closest_TSS.bed

#bedtools sort -i /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/MACSoutput/DMD3_L4_DF301_avg_C1_C2_chip_peaks_final_top_100_peaks.bed > /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/MACSoutput/DMD3_L4_DF301_avg_C1_C2_chip_peaks_final_top_100_peaks_sort.bed
#bedtools closest -D a -a /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/MACSoutput/DMD3_L4_DF301_avg_C1_C2_chip_peaks_final_top_100_peaks_sort.bed -b /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/TSS_WBcel235_sorted.bed >DMD3_L4_DF301_avg_C1_C2_chip_peaks_final_top_100_peaks_closest_TSS.bed

#bedtools closest -D a -a /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/MACSoutput/DMD3_L4_DF301_avg_C1_C2_chip_peaks_final_sort.bed -b /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/TSS_WBcel235_sorted.bed > DMD3_L4_DF301_avg_C1_C2_chip_peaks_final_sort_closet_TSS.bed


#bedtools closest -D a -a /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Narasimhan_DMD_3.motif_WBcel235.bed -b /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/TSS_WBcel235_sorted.bed > Narasimhan_DMD_3.motif_WBcel235_closest_TSS.bed


#bedtools intersect -wa -wb -a /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/reformatted_Narasimhan_DMD_3.motif_WBcel235.bed -b /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/MACSoutput/DMD3_L4_DF301_avg_C1_C2_chip_peaks_final.bed > Narasimhan_DMD_3_motif_WBcel235_overlap_DMD3_L4_DF301_avg_C1_C2_chip_peaks_final.bed
#bedtools closest -D a -a /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/Narasimhan_DMD_3_motif_WBcel235_overlap_DMD3_L4_DF301_avg_C1_C2_chip_peaks_final.bed -b /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/TSS_WBcel235_sorted.bed > Narasimhan_DMD_3_motif_ChIP_peaks_overlap_WBcel235_closest_TSS.bed


#bedtools closest -D a -a /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/reformatted_Narasimhan_DMD_3.motif_WBcel235.bed -b /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/TSS_WBcel235_sorted.bed > Narasimhan_DMD_3.motif_WBcel235_closest_TSS.bed


#bedtools closest -s -D a -a /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/reformatted_Narasimhan_DMD_3.motif_WBcel235.bed -b /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/reformatted_C_elegans_TSS_and_strand.bed > Narasimhan_DMD_3.motif_WBcel235_closest_TSS_same_strand.bed


#bedtools sort -i reformatted_Narasimhan_DMD_3.motif_WBcel235.bed > reformatted_Narasimhan_DMD_3.motif_WBcel235_sorted.bed
#bedtools sort -i reformatted_C_elegans_TSS_and_strand.bed > reformatted_C_elegans_TSS_and_strand_sorted.bed
#bedtools closest -s -D a -a /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/reformatted_Narasimhan_DMD_3.motif_WBcel235.bed -b /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/reformatted_C_elegans_TSS_and_strand.bed > Narasimhan_DMD_3.motif_WBcel235_closest_TSS_same_strand.bed

#bedtools closest -s -D a -a /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/reformatted_Narasimhan_DMD_3.motif_WBcel235_sorted.bed -b /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/reformatted_C_elegans_TSS_and_strand_sorted.bed > Narasimhan_DMD_3.motif_WBcel235_closest_TSS_same_strand.bed
#bedtools closest -S -D a -a /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/reformatted_Narasimhan_DMD_3.motif_WBcel235_sorted.bed -b /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/reformatted_C_elegans_TSS_and_strand_sorted.bed > Narasimhan_DMD_3.motif_WBcel235_closest_TSS_opposite_strand.bed

#bedtools sort -i /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/RNASeq_genes_TSS_and_strand_sorted.bed

#bedtools closest -s -D a -a /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/RNASeq_genes_TSS_and_strand_sorted.bed -b /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/reformatted_Narasimhan_DMD_3.motif_WBcel235_sorted.bed > RNASeq_genes_closest_motif_same_strand.bed
#bedtools closest -S -D a -a /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/RNASeq_genes_TSS_and_strand_sorted.bed -b /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/reformatted_Narasimhan_DMD_3.motif_WBcel235_sorted.bed > RNASeq_genes_closest_motif_opposite_strand.bed
bedtools intersect -a /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/test2.bed -b /scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src/test1.bed > test3.bed



