#!/usr/bin/env bash

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
index_file_name=$(basename -s .amb $index_file)

# Get the Path for the Index.
index_dir_name=$(dirname $index_file)

if [ -z "${1}" ]; then
  num_thread=$(get_cpu_count.py)
else
  num_thread="${1}"
fi

some_fastq=$(find -L ../data -name "*.fastq.gz" | head -1)

if [ -z "${2}" ]; then
  pattern_fwd="_$(get_read_pattern.py "$some_fastq" "1")"
else
  pattern_fwd="${2}"
fi

input_fwd_fastqs=$(find -L ../data -name "*$pattern_fwd")
file_count=$(find -L ../data -name "*$pattern_fwd" | wc -l)
index_file_count=$(find -L ../data -name "*.amb" | wc -l)

if [ -z "${3}" ]; then
  pattern_rev="_$(get_read_pattern.py "$some_fastq" "2")"
else
  pattern_rev="${3}"
fi

if [ -z "${4}" ]; then
  align_score=25
else
  align_score="${4}"
fi

if [ -z "${5}" ]; then
  verbosity=1
else
  verbosity="${5}"
fi

if [ -z "${6}" ]; then
  min_seed_len=19
else
  min_seed_len="${6}"
fi

if [ -z "${7}" ]; then
  band_width=100
else
  band_width="${7}"
fi

if [ -z "${8}" ]; then
  z_dropoff=100
else
  z_dropoff="${8}"
fi

if [ -z "${9}" ]; then
  seed_split_ratio=1.5
else
  seed_split_ratio="${9}"
fi

if [ -z "${10}" ]; then
  max_occ=10000
else
  max_occ="${10}"
fi

if [ -z "${11}" ]; then
  match_score=1
else
  match_score="${11}"
fi

if [ -z "${12}" ]; then
  mm_penalty=4
else
  mm_penalty="${12}"
fi

if [ -z "${13}" ]; then
  gap_open_pen=4
else
  gap_open_pen="${13}"
fi

if [ -z "${14}" ]; then
  gap_ext_pen=1
else
  gap_ext_pen="${14}"
fi

if [ -z "${15}" ]; then
  clip_pen=5
else
  clip_pen="${15}"
fi

if [ -z "${16}" ]; then
  unpair_pen=9
else
  unpair_pen="${16}"
fi

if [ "${17}" == "True" ]; then
  o1='a'
else
  o1=''
fi

if [ "${18}" == "True" ]; then
  o2='M'
else
  o2=''
fi

if [ "${19}" == "True" ]; then
  o3='Y'
else
  o3=''
fi