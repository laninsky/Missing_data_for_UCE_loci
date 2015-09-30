# Missing_data_per_sample
Need to figure out the average amount of missing data per sample across your UCE loci? Look no further!

After you have tweaked the two R scripts (for number of taxa) and uploaded them to your working directory, you can run things by (oh btw - this script is assuming a folder full of fasta files): 
```
touch summary

for i in *.fasta ; do rm count*; cp $i count; Rscript missingcount.R; done;

Rscript missingsummary.R
```

#This pipeline wouldn't be possible without:

R: R Core Team. 2015. R: A language and environment for statistical computing. URL http://www.R-project.org/. R Foundation for Statistical Computing, Vienna, Austria. https://www.r-project.org/

Stringr:  Hadley Wickham (2012). stringr: Make it easier to work with strings..
  R package version 0.6.2. http://CRAN.R-project.org/package=stringr (for up-to-date citation information run citation("stringr" in R)
