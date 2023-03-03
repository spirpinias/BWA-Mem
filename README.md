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

Pattern Forward
- The unique suffix to identify your forward. 

Pattern Reverse
- The unique suffix to identify your reverse.

Minimum Mapping Quality
- An integer > 0 for any read aligned with quality less than this value will not be accepted.

Verbosity
- Amount of logging info from BWA. 0 outputs nothing, 1 outputs errors, 2 for warnings and errors and 4 or higher for debugging. 4 will not output alignments. 

Minimum Seed Leng 
- Matches shorter than INT will be missed.

Band Width 
- Essentially, gaps longer than INT will not be found.

Drop Off 
- top extension when the difference between the best and the current extension score is above |i-j|*A+INT, where i and j are the current positions of the query and reference, respectively, and A is the matching score.

Seed Split Ratio
- Larger value yields fewer seeds, which leads to faster alignment speed but lower accuracy.

Discard Reads if More than INT Occurences
- Removes redundant reads.

Matching Score 
- Award for finding a match.

Mismatch Penalty 
- Penalizes from poor alignments

Gap Open Penalty
- Price paid for opening a gap between two reads.

Gap Extension Penalty 
- Price paid for extending a gap between two reads.

Clipping Penalty 
- When performing SW extension, BWA-MEM keeps track of the best score reaching the end of query. If this score is larger than the best SW score minus the clipping penalty, clipping will not be applied.

Penalty for Unpaired Read Pair 
- BWA-MEM scores an unpaired read pair as scoreRead1+scoreRead2-INT and scores a paired as scoreRead1+scoreRead2-insertPenalty. It compares these two scores to determine whether we should force pairing.

## Source 

https://bio-bwa.sourceforge.net/bwa.shtml

## Output

**.bam**: Output alignments

**.bam.bai**: Output index (if chosen)

<hr>

[Code Ocean](https://codeocean.com/) is a cloud-based computational platform that aims to make it easy for researchers to share, discover, and run code.<br /><br />
[![Code Ocean Logo](images/CO_logo_68x36.png)](https://www.codeocean.com)