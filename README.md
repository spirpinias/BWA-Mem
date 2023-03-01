[![Code Ocean Logo](images/CO_logo_135x72.png)](http://codeocean.com/product)

<hr>

# BWA 

BWA is a software package for mapping low-divergent sequences against a large reference genome, such as the human genome. It consists of three algorithms: BWA-backtrack, BWA-SW and BWA-MEM. The first algorithm is designed for Illumina sequence reads up to 100bp, while the rest two for longer sequences ranged from 70bp to 1Mbp. BWA-MEM, which is the latest, is generally recommended for high-quality queries as it is faster and more accurate.

For all the algorithms, BWA first needs to construct the FM-index for the reference genome (the index command). Alignment algorithms are invoked with different sub-commands: aln/samse/sampe for BWA-backtrack, bwasw for BWA-SW and mem for the BWA-MEM algorithm.


## Input data

In **data** directory, tool searches for *.fastq.gz files. If a reference directory is not supplied, it is inferred by the location of \*.amb. 

## Parameters 

Threads
- Number of threads used by BWA. If not specified, will use all available. 

Minimum Mapping Quality
- An integer > 0 for any read aligned with quality less than this value will not be accepted.

Verbosity
- Amount of logging info from BWA. 0 outputs nothing, 1 outputs errors, 2 for warnings and errors and 4 or higher for debugging. 4 will not output alignments. 

Sort and index
- Sort and index bam file after alignment using sambamba.

## Output

**.bam**: Output alignments

**.bam.bai**: Output index (if chosen)

<hr>

[Code Ocean](https://codeocean.com/) is a cloud-based computational platform that aims to make it easy for researchers to share, discover, and run code.<br /><br />
[![Code Ocean Logo](images/CO_logo_68x36.png)](https://www.codeocean.com)