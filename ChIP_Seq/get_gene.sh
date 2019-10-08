#!/bin/bash
#BATCH --verbose
#SBATCH --job-name=get_gene_names
#SBATCH --time=3:00:00
#SBATCH --nodes=1
#SBATCH --mem=20GB
#SBATCH --mail-type=ALL


while read -r LINE; 
 do grep -w "$LINE" neg_strand_intron.gff | sort -k 5 -n -r | head -n1; 
 done < neg_strand_gene_names  > neg_strand_first_introns.gff


