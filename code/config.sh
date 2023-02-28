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

# BWA
some_fastq=$(find -L ../data -name "*.fastq.gz" | head -1)

if [ -z "${1}" ]; then
  bwa_algorithm="mem"
else
  bwa_algorithm="${1}"
fi

if [ -z "${2}" ]; then
  num_thread=$(get_cpu_count.py)
else
  num_thread="${2}"
fi

if [ -z "${3}" ]; then
  pattern_fwd="_$(get_read_pattern.py "$some_fastq" "1")"
else
  pattern_fwd="${3}"
fi

if [ -z "${4}" ]; then
  pattern_rev="_$(get_read_pattern.py "$some_fastq" "2")"
else
  pattern_rev="${4}"
fi

if [ -z "${5}" ]; then
  align_score=25
else
  align_score="${5}"
fi

if [ -z "${6}" ]; then
  verbosity=1
else
  verbosity="${6}"
fi