# Missing_data_per_sample v0.0
Need to figure out the average amount of missing data per sample across your UCE loci? Look no further!

After you have copied the three R scripts to your working directory (a folder full of fasta files where missing data designators have NOT been added for taxa missing from those alignments), you can run things by: 
```
touch summary

# Counting the missing data by sample AND locus
Rscript missingcount.R

# To summarize missing data by sample
Rscript missingsummary_sample.R

# To summarize missing data by locus
Rscript missingsummary_loci.R
```

missingsummary_sample.R outputs a file called missing_data_by_taxa.txt and missingsummary_loci.R outputs a file called missing_data_by_locus.txt. In these files, the mean/sd of missing data (bp) is given for the sample/locus combinations where data is actually present. Completely missing sample/loci are captured in the numbers in the final column, 'Number of missing taxa' or 'Number of missing loci', respectively. 

If you would like to calculate similar statistics on a concatenated phylip file, please check out:
https://github.com/laninsky/UCE_processing_steps/blob/master/missing_data.R

## This pipeline wouldn't be possible without:

R: R Core Team. 2015. R: A language and environment for statistical computing. URL http://www.R-project.org/. R Foundation for Statistical Computing, Vienna, Austria. https://www.r-project.org/

Stringr:  Hadley Wickham (2012). stringr: Make it easier to work with strings..
  R package version 0.6.2. http://CRAN.R-project.org/package=stringr (for up-to-date citation information run citation("stringr" in R)

Along with the programs above, to cite this pipeline:

Alexander, A. 2019.  Missing_data_per_sample v0.0. Avaiable from: https://github.com/laninsky/Missing_data_for_UCE_loci

Beetle TBD

## Version history
0.0: Version used in Beetle TBD
