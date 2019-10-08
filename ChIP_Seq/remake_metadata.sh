#!/bin/bash
# Parse the config file and save the metadata in the metadata_dir directory.
# This nested ifelse will get the protein names, chip IDs, input IDs etc.


WORKING_DIR=$(pwd)
YAML_CONFIG=$WORKING_DIR/config_v1.yaml
MAIL=$(egrep 'mail:' $YAML_CONFIG | awk '!/^#/ && $0=$2')
NYUID=$(egrep 'nyuid:' $YAML_CONFIG | awk '!/^#/ && $0=$2')
SBATCH_SCRIPTS=$(pwd)
GENE_TSS_ANNOT=$(egrep 'gene_tss_annot:' $YAML_CONFIG | awk '!/^#/ && $0=$2')


metadata_dir=$WORKING_DIR/metadata_dir
forMacs=$WORKING_DIR/forMacs.txt
mkdir -p $metadata_dir
egrep -A 6 "sample_id: [0-9]+" config_v1.yaml | while read -r line ; do
  val="$(cut -d ' ' -f 2 <<< $line)"
  if [[ -n "$(grep 'sample_id:' <<< $line)" ]]; then
    val="$(cut -d ' ' -f 3 <<< $line)"
    sample_id="$val"
    printf "Sample: $sample_id\n"
  elif [[ -n "$(grep 'protein_name:' <<< $line)" ]]; then
    protein="$val"
    printf "Protein: $protein\n"
  elif [[ -n "$(grep 'average_descriptive_name:' <<< $line)" ]]; then
    average_descriptive_name="$val"
    printf "Average descriptive name: $average_descriptive_name\n"
  elif [[ -n "$(grep 'input_file:' <<< $line)" ]]; then
    input="${val%%.*}"
    printf "Input: $input\n"
  elif [[ -n "$(grep 'input_seq_id:' <<< $line)" ]]; then
    input_seq_id="$val"
    printf "Input seq id: $input_seq_id\n"
  elif [[ -n "$(grep 'chip_file:' <<< $line)" ]]; then
    chip="${val%%.*}"
    printf "Chip file: $chip\n"
  elif [[ -n "$(grep 'chip_seq_id:' <<< $line)" ]]; then
    chip_seq_id="$val"
    printf "Chip seq id: $chip_seq_id\n"

    printf ""
    printf "${chip} ${chip_seq_id} ${input} ${input_seq_id}\n" >> $metadata_dir/paired_${sample_id}.txt
    printf "${protein} ${average_descriptive_name}" > $metadata_dir/metadata_${sample_id}.txt
    printf "${chip}.bam ${input}.bam ${chip} single\n" >> $forMacs
    printf "\----------\n"
  fi
done
