+++
title = "trf-usage"
showall = true
summary = """
  Brief usage of TRF: a tandem repeats finder
  """
rss = summary
# img = "/assets/img/preview.jpg"  # preview
# hero = "/assets/img/cover.jpg"   # cover

hasplotly = false
hasmermaid = false

pubdate = Date("2018-02-05")

tags = ["bioinformatics","genomics"]
+++
{{page_tags}}



## TRF安装

    wget http://tandem.bu.edu/trf/downloads/trf409.linux64
    chmod a+x trf409.linux64
    mv trf409.linux64 $SFTW/bin/trf

## TRF使用

Using Command Line Version of Tandem Repeats Finder

Once the program is installed you can run it with no parameters to obtain information on proper 
usage syntax.

If you installed the program as trf then by typing trf at the command line you will see the 
following output: 

```
Please use: trf File Match Mismatch Delta PM PI Minscore MaxPeriod [options]

Where: (all weights, penalties, and scores are positive)
  File = sequences input file
  Match  = matching weight
  Mismatch  = mismatching penalty
  Delta = indel penalty
  PM = match probability (whole number)
  PI = indel probability (whole number)
  Minscore = minimum alignment score to report
  MaxPeriod = maximum period size to report
  [options] = one or more of the following:
        -m        masked sequence file
        -f        flanking sequence
        -d        data file
        -h        suppress html output
        -r        no redundancy elimination
        -l <n>    maximum TR length expected (in millions) (eg, -l 3 or -l=3 for 3 million)

Note the sequence file should be in FASTA format:

>Name of sequence
aggaaacctgccatggcctcctggtgagctgtcctcatccactgctcgctgcctctccag
atactctgacccatggatcccctgggtgcagccaagccacaatggccatggcgccgctgt
actcccacccgccccaccctcctgatcctgctatggacatggcctttccacatccctgtg
```

The program accepts a minimum of eight parameters. Options can be specified to generate additional files.

The following is a more detailed description of the parameters:

> __File:__ The sequence file to be analyzed in FASTA format( see for details). Multiple sequence in
>  the same file are allowed.
> 
> __Match, Mismatch, and Delta:__ Weights for match, mismatch and indels. These parameters are for 
> Smith-Waterman style local alignment using wraparound dynamic programming. Lower weights allow 
> alignments with more mismatches and indels. A match weight of 2 has proven effective with mismatch
>  and indel penalties in the range of 3 to 7. Mismatch and indel weights are interpreted as negative
>   numbers. A 3 is more permissive and a 7 less permissive. The recomended values for Match Mismatch
>    and Delta are 2, 7, and 7 respectively.
> 
> __PM and PI:__ Probabilistic data is available for PM values of 80 and 75 and PI values of 10 and 
> 20. The best performance can be achieved with values of PM=80 and PI=10. Values of PM=75 and PI=20
>  give results which are very similar, but often require as much as ten times the processing time 
>  when compared with values of PM=80 and PI=10.
> 
> __Minscore:__ The alignment of a tandem repeat must meet or exceed this alignment score to be 
> reported. For example, if we set the matching weight to 2 and the minimun score to 50, assuming 
> perfect alignment, we will need to align at least 25 characters to meet the minimum score 
> (for example 5 copies with a period of size 5).
> 
> __Maxperiod:__ Period size is the program's best guess at the pattern size of the tandem repeat. 
> The program will find all repeats with period size between 1 and 2000, but the output can be 
> limited to a smaller range.
> 
> __-m:__ This is an optional parameter and when present instructs the program to generate a masked
>  sequence file. The masked sequence file is a FASTA format file containing a copy of the sequence
>   with every location that occurred in a tandem repeat changed to the letter 'N'. The word "masked"
>    is added to the sequence description line just after the '>' character.
> 
> __-f:__ If this option is present, flanking sequence around each repeat is recorded in the alignment
>  file. This may be useful for PCR primer determination. Flanking sequence consists of the 500 
>  nucleotides on each side of a repeat.
> 
> __-d:__ A data file is produced if this option is present. This file is a text file which contains
>  the same information, in the same order, as the summary table file, plus consensus pattern and 
>  repeat sequences. This file contains no labeling and is suitable for additional processing, for 
>  example with a perl script, outside of the program.
> 
> __-h:__ suppress HTML output (this automatically switches -d to ON)
> 
> __-l <n>:__ Specifies that the longest TR array expected in the input is at most n million bp long.
>  The default is 2 (for 2 million). Setting this option too high may result in an error message if 
>  you did not have enough availablememory. We have only tested this option uo to value 29.
> 
> __-u:__ Prints the help/usage message above
> 
> __-v:__ Prints the version information
> 
> __-ngs:__ More compact .dat output on multisequence files, returns 0 on success. You may pipe input
>  in with this option using - for file name. Short 50 flanks are appended to .dat output. .dat 
>  output actually goes to stdout instead of file. Sequence headers are displayed in output as 
>  @header. Only headers containing repeats are shown.

Using recommended parameters the command line will look something like:

`trf yoursequence.txt 2 7 7 80 10 50 500 -f -d -m`

Once the program starts running it will print update messages to the screen. The word "Done" will be
 printed when the program finishes.

For single sequence input files there will be at least two HTML format output files, a repeat table 
file and an alignment file. If the number of repeats found is greater than 120, multiple linked 
repeat tables are produced. The links to the other tables appear at the top and the bottom of each 
table. To view the results start by opening the first repeat table file with your web browser. This 
file has the extension ".1.html". Alignment files can be accessed from the repeat table files. 
Alignment files end with the ".txt.html" extension.

For input files containing multiple sequences a summary page is produced that links to the output of 
individual sequences. This file has the extension "summary.html". You should start by opening this 
file if your input had multiple sequences in the same file. Also note that the output files of 
individual sequences will have an identifier of the form ".sn." ( n an integer) embedded in the name 
indicating the index of the sequence in the input file. The identifier is omitted for single sequence 
input files. 


### -d输出结果说明

加上`-d`指令后,会输出一个`.dat`文件,包含所有网页文件中的结果,方便用于perl脚本的操作,输出文件为:

>Sequence: chr1
Parameters: 2 7 7 80 10 50 2000
1088 1115 2 14.0 2 100 0 56 50 0 50 0 1.00 GA GAGAGAGAGAGAGAGAGAGAGAGAGAGA
8812 8849 2 19.5 2 94 5 69 52 0 0 47 1.00 AT ATATAATATATATATATATATATATATATATATATATA

格式为:

| Col |      Means      |
|-----|-----------------|
|   1 | start           |
|   2 | end             |
|   3 | Period Size     |
|   4 | Copy Number     |
|   5 | Consensus Size  |
|   6 | Percent Matches |
|   7 | Percent Indels  |
|   8 | Score           |
|   9 | A               |
|  10 | C               |
|  11 | G               |
|  12 | T               |
|  13 | Entropy (0-2)   |
|  14 | Motif seq       |
|  15 | Repeat seq      |


