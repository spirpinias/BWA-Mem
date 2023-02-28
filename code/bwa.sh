#!/usr/bin/env bash

source ./config.sh
source ./utils.sh

input_fwd_fastqs=$(find -L ../data -name "*$pattern_fwd")

file_count=$(find -L ../data -name "*$pattern_fwd" | wc -l)
index_file_count=$(find -L ../data -name "*.amb" | wc -l)

echo "Using threads: $num_threads"
echo "Input R1 Fastqs: $input_fwd_fastqs"

if [ "$index_file_count" -eq 1 ];
then

  echo "Environment has 1 Genome Index. Proceeding"

  if [ "$file_count" -eq 1 ]; 
  then
    
    echo "Using $num_thread Available Threads"
    echo "Running in Single End Mode"

    # Grabbing the Sequencing Files
    file=$(find -L ../data -name "*.fastq.gz")
    filename=$(basename -a $file)
    file_prefix=$(get_read_prefix.py $filename)
    
    # Grabbing the Index Prefix
    index_file=$(find -L ../data -name "*.amb")
    index_file_name=$(basename -s .amb $index_file)

    # Get the Path for the Index.
    index_dir_name=$(dirname $index_file)

    # Run BWA-MEM.
    bwa mem -M -t "$num_thread" -T "$align_score" -v "$verbosity" "${index_dir_name}/${index_file_name}" "$file" | samtools view -b - > ../results/"$file_prefix".bam

  elif [ "$file_count" -eq 2 ] && [ "$index_file_count" -eq 1 ]; then
    
    echo "Using $num_thread Available Threads"
    echo "Running in Paired End Mode"
    
    file1_count=$(find -L ../data -name "*${pattern_fwd}" | wc -l)
    file2_count=$(find -L ../data -name "*${pattern_rev}" | wc -l)

    if [ "$file1_count" -ne 1 ] || [ "$file2_count" -ne 1 ]; then
      echo -e "The patterns you are using to identify the forward and reverse reads files is not working.\npattern_fwd: ${pattern_fwd}\npattern_rev: ${pattern_rev}\nThese are the .fastq.gz files you are trying to identify\n$(find -L ../data -name "*.fastq.gz")"
    fi

    # Grabbing the File Prefix.
    file1=$(find -L ../data -name "*${pattern_fwd}")
    file2=$(find -L ../data -name "*${pattern_rev}")
    filename=$(basename -a $file1)
    file_prefix=$(get_read_prefix.py $filename)

    # Grabbing the Index Prefix
    index_file=$(find -L ../data -name "*.amb")
    index_file_name=$(basename -s .amb $index_file)

    # Get the parent directory of the index file name.
    index_dir_name=$(dirname $index_file)

    echo "File 1: $file1"
    echo "File 2: $file2"
    echo "File Prefix: $file_prefix"

    ## Run BWA-MEM. 
    bwa mem -M -t "$num_thread" -T "$align_score" -v "$verbosity" "${index_dir_name}/${index_file_name}" "$file1" "$file2" | samtools view -b - > ../results/"$file_prefix".bam
    
  else
    echo "You have $file_count fastq files in the data folder. There should be 1 or 2."
  fi
  
else
  echo "Please ensure your environment has only 1 indexed genome."
fi