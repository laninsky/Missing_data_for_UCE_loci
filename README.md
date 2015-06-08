# Missing_data_per_sample
Need to figure out the average amount of missing data per sample across your UCE loci? Look no further!

After you have tweaked the two R scripts (for number of taxa) and uploaded them to your working directory, you can run things by (oh btw - this script is assuming a folder full of fasta files): 
```
touch summary

for i in *.fasta ; do rm count*; cp $i count; Rscript missingcount.R; done;

Rscript missingsummary.R
```
