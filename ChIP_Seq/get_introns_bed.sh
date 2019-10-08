#!/bin/bash
#BATCH --verbose
#SBATCH --job-name=introns
#SBATCH --time=5:00:00
#SBATCH --nodes=1
#SBATCH --mem=20GB
#SBATCH --mail-type=ALL

#grep 'intron' c_elegans.PRJNA13758.WS272.annotations.gff3 > intron.gff
#grep '+' intron.gff > pos_strand_intron.gff
#grep '-' intron.gff > neg_strand_intron.gff

#cut -d':' -f2 neg_strand_intron.gff | cut -d ';' -f1 | sort | uniq > neg_strand_gene_names
#cut -d':' -f2 pos_strand_intron.gff | cut -d ';' -f1 | sort | uniq > pos_strand_gene_names

#to get first introns on negative strands

#while read -r LINE; 
# do grep -w "$LINE" neg_strand_intron.gff | sort -k 5 -n -r | head -n1; 
# done < neg_strand_gene_names  > neg_strand_first_introns.gff


#grep '4R79.1a' test.gff | sort -k 5 -n -r | head -n1

#To get first introns on positive strands

while read -r LINE; 
 do grep -w "$LINE" pos_strand_intron.gff | sort -k 5 -n | head -n1; 
 done < pos_strand_gene_names  > pos_strand_first_introns.gff
