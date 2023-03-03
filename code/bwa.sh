#!/usr/bin/env bash

source ./config.sh
source ./utils.sh

echo "Using threads: $num_thread"
echo "Input R1 Fastqs: $input_fwd_fastqs"

if [ "$index_file_count" -ne 1 ];
then
  echo "Please ensure your data directory has contains 1 indexed genome."
  exit 1
fi

for input_fwd_fastq in $input_fwd_fastqs
do
  file_prefix=$(sed "s/$pattern_fwd//" <<< $input_fwd_fastq)
  file_prefix=$(basename $file_prefix)
  input_rev_fastq=$(get_reverse_file "$input_fwd_fastq")

  if [ -z $input_rev_fastq ]; then
    echo "Running in single end mode"
    read_files="$input_fwd_fastq"
  else
    echo "Running in paired end mode."
    read_files="$input_fwd_fastq $input_rev_fastq"
  fi

  bwa $bwa_algorithm -M -t "$num_thread" -T "$align_score" -v "$verbosity" "${index_dir_name}/${index_file_name}" $read_files | samtools view -b - > ../results/"$file_prefix".bam
done
  