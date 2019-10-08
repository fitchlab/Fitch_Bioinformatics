#!/bin/bash

#BATCH --verbose
#SBATCH --job-name=chip_1
#SBATCH --time=15:00:00
#SBATCH --nodes=1
#SBATCH --mem=20GB
#SBATCH --mail-type=ALL


#Time
start=$(date +"%T")
echo "ChIP pipeline starts at: $start"

export WORKING_DIR=$(pwd)
export YAML_CONFIG=$WORKING_DIR/config_v1.yaml
export MAIL=$(egrep 'mail:' $YAML_CONFIG | awk '!/^#/ && $0=$2')
export NYUID=$(egrep 'nyuid:' $YAML_CONFIG | awk '!/^#/ && $0=$2')
export SBATCH_SCRIPTS=$(pwd)
export GENE_TSS_ANNOT=$(egrep 'gene_tss_annot:' $YAML_CONFIG | awk '!/^#/ && $0=$2')


##
# Waits for a sbatch job to finish.
# Input: string, the message returned by the sbatch command
#        e.g: 'Submitted batch job 4424072' ID i
# Will query the queue to ask if the job ID is found. Will
# sleep progress until job is cleared from the queue.
##
wait_for_job(){
  # extract only the jobid from the job output
  jobout="$1"
  jobid="${jobout##* }"

  sleep 5
  is_running=$(squeue -u $NYUID | grep $jobid | wc -l)
  while [[ $is_running -gt 0 ]]
  do
    sleep 15
    is_running=$(squeue -u $NYUID | grep $jobid | wc -l)
  done
}

#Define lab directory for automatic output archiving
ercan_chip="/scratch/pf887/chipseq/NewChIPData/ChIPseq_Ercan_git_clone/src"

echo "Running ChIP-seq pipeline"

#Move working directory to match that of where the pipeline was initiated
cd $WORKING_DIR

mkdir -p reports

# Parse the config file and save the metadata in the metadata_dir directory.
# This nested ifelse will get the protein names, chip IDs, input IDs etc.
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

echo "Unzipping files..."
#gunzip $WORKING_DIR/*.gz


############### Run Bowtie

#List and count many fastqs in the directory
ls *.fastq > files.txt 2> /dev/null
n=$(wc -l files.txt | awk '{print $1}')

#If there are fastqs then run bowtie
if (($n > 0)); then
  echo "Running Bowtie..."
  job_out=$(sbatch --output=$WORKING_DIR/reports/slurm_bowtie_%j.out\
                  --error=$WORKING_DIR/reports/slurm_bowtie_%j.err\
                  --mail-type=ALL\
                  --mail-user=$MAIL\
                  --array=1-$n\
                  $SBATCH_SCRIPTS/doBowtie_Single.s)

  wait_for_job "$job_out"
  echo "Bowtie finished..."

  # Record keeping. Save the bowite mapping metadata
  mkdir -p ReadAlignments
  mv Read_Alignment*txt ReadAlignments

  # Get organized. Move the Fastq files into their own directory
  mkdir Fastq
  mv *fastq Fastq
fi

#Remove the bowtie input name file
rm files.txt

# Get organized. Move the mapped BAM files to their own directory
#mkdir BAM
#mv *bam BAM

#cd $WORKING_DIR/BAM


