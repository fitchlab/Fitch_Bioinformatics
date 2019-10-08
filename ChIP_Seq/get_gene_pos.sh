#!/bin/bash
#BATCH --verbose
#SBATCH --job-name=pos_get_gene
#SBATCH --time=3:00:00
#SBATCH --nodes=1
#SBATCH --mem=20GB
#SBATCH --mail-type=ALL



while read -r LINE; 
 do grep -w "$LINE" pos_strand_intron.gff | sort -k 5 -n -r | head -n1; 
 done < pos_strand_gene_names  > pos_strand_first_introns.gff


