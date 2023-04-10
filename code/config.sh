#!/usr/bin/env bash

set -ex

if [ $# -eq 0 ]; then
  echo "No arguments supplied"
else
  echo "args:"
  for i in $*; do 
    echo $i 
  done
  echo ""
fi

# Find the Index Prefix
index_file=$(find -L ../data -name "*.amb")
index_file_count=$(echo $index_file | wc -w)
if [ "$index_file_count" -ne 1 ];
then
  echo "Please ensure your data directory has contains 1 indexed genome."
  exit 1
fi

index_file_name=$(basename -s .amb $index_file)


# Get the Path for the Index.
index_dir_name=$(dirname $index_file)

if [ -z "${1}" ]; then
  num_thread=$(get_cpu_count.py)
else
  num_thread="${1}"
fi

some_fastq=$(find -L ../data -name "*.f*q*" | head -1)

if [ -z "${2}" ]; then
  pattern_fwd="_$(get_read_pattern.py "$some_fastq" "1")"
else
  pattern_fwd="${2}"
fi

input_fwd_fastqs=$(find -L ../data -name "*$pattern_fwd")
file_count=$(echo $input_fwd_fastqs | wc -w)

if [ -z "${3}" ]; then
  pattern_rev="_$(get_read_pattern.py "$some_fastq" "2")"
else
  pattern_rev="${3}"
fi

if [ -z "${4}" ]; then
  align_score_min=""
else
  align_score_min="-T ${4}"
fi

if [ -z "${5}" ]; then
  verbosity=""
else
  verbosity="-v ${5}"
fi

if [ -z "${6}" ]; then
  min_seed_len=""
else
  min_seed_len="-k ${6}"
fi

if [ -z "${7}" ]; then
  band_width=""
else
  band_width="-w ${7}"
fi

if [ -z "${8}" ]; then
  z_dropoff=""
else
  z_dropoff="-d ${8}"
fi

if [ -z "${9}" ]; then
  seed_split_ratio=""
else
  seed_split_ratio="-r ${9}"
fi

if [ -z "${10}" ]; then
  max_occ=""
else
  max_occ="-c ${10}"
fi

if [ -z "${11}" ]; then
  match_score=""
else
  match_score="-A ${11}"
fi

if [ -z "${12}" ]; then
  mm_penalty=""
else
  mm_penalty="-B ${12}"
fi

if [ -z "${13}" ]; then
  gap_open_pen=""
else
  gap_open_pen="-O ${13}"
fi

if [ -z "${14}" ]; then
  gap_ext_pen=""
else
  gap_ext_pen="-E ${14}"
fi

if [ -z "${15}" ]; then
  clip_pen=""
else
  clip_pen="-L ${15}"
fi

if [ -z "${16}" ]; then
  unpair_pen=""
else
  unpair_pen="-U ${16}"
fi

if [ "${17}" == "True" ]; then
  output_all='-a'
else
  output_all=''
fi

if [ "${18}" == "True" ]; then
  mark_short_secondary='-M'
else
  mark_short_secondary=''
fi

if [ "${19}" == "True" ]; then
  soft_clipping='-Y'
else
  soft_clipping=''
fi

if [ "${20}" == "True" ]; then
  skip_mate_rescue='-S'
else
  skip_mate_rescue=''
fi

if [ "${21}" == "True" ]; then
  skip_pairing='-P'
else
  skip_pairing=''
fi