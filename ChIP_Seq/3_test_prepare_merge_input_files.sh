#!/bin/bash
# Create the input file for the merging script
WORKING_DIR=$(pwd)
echo "working dir $WORKING_DIR"
forMacs=$WORKING_DIR/forMacs.txt
echo " forMacs $forMacs"
metadata_dir=$WORKING_DIR/metadata_dir
echo "$metadata_dir"
forMerge=$WORKING_DIR/BAM/forMerge.txt

YAML_CONFIG=$WORKING_DIR/config_v1.yaml
MAIL=$(egrep 'mail:' $YAML_CONFIG | awk '!/^#/ && $0=$2')
NYUID=$(egrep 'nyuid:' $YAML_CONFIG | awk '!/^#/ && $0=$2')
SBATCH_SCRIPTS=$(pwd)
GENE_TSS_ANNOT=$(egrep 'gene_tss_annot:' $YAML_CONFIG | awk '!/^#/ && $0=$2')

for sample_file in $metadata_dir/paired_*; do
  chips=()
  inps=()
  chip_seqs=""
  inp_seqs=""
  while read -r line || [[ -n "$line" ]]; do
    read chip chip_seq_id input input_seq_id <<< $line
    chips+=("${chip}.bam")
    inps+=("${input}.bam")
    [[ -n $chip_seqs ]] && chip_seqs="${chip_seqs}_${chip_seq_id}" || chip_seqs="$chip_seq_id"
    [[ -n $inp_seqs ]] && inp_seqs="${inp_seqs}_${input_seq_id}" || inp_seqs="$input_seq_id"
  done < $sample_file

  sample_basename=$(basename $sample_file)
  tmp="${sample_basename#paired_}"
  sample_id="${tmp%.txt}"
  read -r protein average_descriptive_name < $metadata_dir/metadata_${sample_id}.txt
  printf "${chip_seqs} ${protein}\n" >> $WORKING_DIR/forUCSC.txt

  chip_seqs="avg_${chip_seqs}"
  inp_seqs="avg_${inp_seqs}"
  merged_chip_prefix="${average_descriptive_name}_${chip_seqs}_chip"
  merged_inp_prefix="${average_descriptive_name}_${inp_seqs}_input"
  merged_chip_bam="${merged_chip_prefix}.bam"
  merged_inp_bam="${merged_inp_prefix}.bam"
  printf "$merged_chip_bam ${chips[*]}\n" >> $forMerge
  printf "$merged_inp_bam ${inps[*]}\n" >> $forMerge
  printf "$merged_chip_prefix ${chip_seqs} $merged_inp_prefix ${inp_seqs}\n" >> $sample_file
  printf "$merged_chip_bam $merged_inp_bam $merged_chip_prefix merged\n" >> $forMacs
done

