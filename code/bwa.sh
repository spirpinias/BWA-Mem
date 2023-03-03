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
  
  bwa mem $(echo $o1$o2$o3$o4$o5$o6) -t "$num_thread" -k "${min_seed_len}" -w "${band_width}" -d "${z_dropoff}" -r "${seed_split_ratio}" -c "${max_occ}" -A "${match_score}" -E "${gap_ext_pen}" -O "${gap_open_pen}" -B "${mm_penalty}" -L "${clip_pen}" -U "${unpair_pen}" -T "$align_score" -v "$verbosity" "${index_dir_name}/${index_file_name}" $read_files | samtools view -b - > ../results/"$file_prefix".bam
done
  