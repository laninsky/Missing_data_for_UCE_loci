# Missing_data_per_sample v0.0
Need to figure out the average amount of missing data per sample across your UCE loci? Look no further!

After you have tweaked the three R scripts for number of taxa (2N for missingcount.R, just N for missingsummary_loci.R and missingsummary_loci.R) and uploaded them to your working directory, you can run things by (oh btw - this script is assuming a folder full of fasta files): 
```
touch summary

for i in *.fasta ; do rm count*; cp $i count; Rscript missingcount.R; done;

# To summarize misssing data by sample
Rscript missingsummary_sample.R

# To summarize missing data by locus
ls *.fasta > fasta_names
Rscript missingsummary_loci.R
```

If you would like to calculate similar statistics on a concatenated phylip file, please check out:
https://github.com/laninsky/UCE_processing_steps/blob/master/missing_data.R

## This pipeline wouldn't be possible without:

R: R Core Team. 2015. R: A language and environment for statistical computing. URL http://www.R-project.org/. R Foundation for Statistical Computing, Vienna, Austria. https://www.r-project.org/

Stringr:  Hadley Wickham (2012). stringr: Make it easier to work with strings..
  R package version 0.6.2. http://CRAN.R-project.org/package=stringr (for up-to-date citation information run citation("stringr" in R)

Along with the programs above, to cite this pipeline:

Alexander, A. 2019.  Missing_data_per_sample v0.0. Avaiable from: https://github.com/laninsky/Missing_data_for_UCE_loci

TBD

## Version history
0.0: Version used in Baca et al. (2017)
