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
