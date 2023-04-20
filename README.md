[![Code Ocean Logo](images/CO_logo_135x72.png)](http://codeocean.com/product)

<hr>

# BWA - Mem

BWA is a software package for mapping low-divergent sequences against a large reference genome, such as the human genome. BWA-MEM, which is the latest, is generally recommended for high-quality queries as it is faster and more accurate than other BWA alignment algorithms. 

BWA first needs to construct the FM-index for the reference genome (the index command). See [associated capsule](https://apps.codeocean.com/capsule/9591214)

It is important to note that the BWA documentation online is not always up to date with the current parameters. The help text can be found [here](bwa_help_text.txt)

## Input data

In **data** directory, tool searches for *.fastq.gz files. If a reference directory is not supplied, it is inferred by the location of \*.amb. 

## Parameters 
### Main Parameters
Threads
- Number of threads used by BWA. If not specified, will use all available. 

Pattern Forward
- The unique suffix to identify your forward. 

Pattern Reverse
- The unique suffix to identify your reverse.

## Auxiliary Parameters
*Note:* It is unlikely you will need to adjust these parameters.  

Minimum Mapping Quality
- An integer > 0 for any read aligned with quality less than this value will not be accepted (-T)

Verbosity
- Amount of logging info from BWA. 0 outputs nothing, 1 outputs errors, 2 for warnings and errors and 4 or higher for debugging. 4 will not output alignments (-v)

Minimum Seed Length
- Matches shorter than this parameter will be missed. (-k)

Bandwidth 
- Gaps longer than this parameter will be missed (-w)

Drop Off 
- Off-diagonal X-dropoff (Z-dropoff). Stop extension when the difference between the best and the current extension score is above |i-j|*A+drop off, where i and j are the current positions of the query and reference, respectively, and A is the matching score. (-d)

Seed Split Ratio
- Larger value yields fewer seeds, which leads to faster alignment speed but lower accuracy. (-r)

Discard Reads if More than INT Occurences
- Removes redundant reads. (-c)

Matching Score 
- Score for matching bp. (-A)

Mismatch Penalty 
- Penalty for bp mismatch. (-B)

Gap Open Penalty
- Price paid for opening a gap between two reads. (-O)

Gap Extension Penalty 
- Price paid for extending a gap between two reads. (-E)

Clipping Penalty 
- When performing SW extension, BWA-MEM keeps track of the best score reaching the end of query. If this score is larger than the best SW score minus the clipping penalty, clipping will not be applied. (-L)

Penalty for Unpaired Read Pair 
- BWA-MEM scores an unpaired read pair as scoreRead1+scoreRead2-INT and scores a paired as scoreRead1+scoreRead2-insertPenalty. It compares these two scores to determine whether we should force pairing. (-U)


Output all found alignments for single-end or unpaired paired-end reads.
- Include all alignments rather than highest scoring (-a)

Mark Shorter Split Hits as Secondary
- Necessary for Picard compatibility. (-M)

Use Soft Clipping for Supplementary Alignments
- Use soft clipping in the output. Hard clipping may interfere with some structural variant callers. (-Y)

Skip Mate Rescue
- If one read maps and the other doesn't, BWA attempts to rescue the other read by performing Smith-Waterman alignment with the unmapped mate, this disables mate rescue. (-S)

Skip Pairing
- Skip pairing; mate rescue performed unless "Skip Mate Rescue" also in use. If both Skip Mate and Skip Pairing are set, R1 and R2 are treated as single end reads. (-P)

## Output

**.bam**: Output alignments

**.bam.bai**: Output index (if chosen)

## Source 

https://github.com/lh3/bwa

## Cite

Li H. and Durbin R. (2009) Fast and accurate short read alignment with Burrows-Wheeler Transform. Bioinformatics, 25:1754-60. [PMID: 19451168]

<hr>

[Code Ocean](https://codeocean.com/) is a cloud-based computational platform that aims to make it easy for researchers to share, discover, and run code.<br /><br />
[![Code Ocean Logo](images/CO_logo_68x36.png)](https://www.codeocean.com)