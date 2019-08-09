# Loading in require libraries
library("tidyverse")

# Reading in the intermediate summary file
intable <- read_table2("summary",col_names=FALSE)

# Summarizing the data
no_loci <- length(as.matrix(unique(intable$X3)))

outtable <- intable %>% group_by(X1) %>% 
  summarise(mean_missing_bp=mean(X2),sd_missing_bp=sd(X2),no_missing_taxa=(no_loci-length(unique(X3))))

names(outtable) <- c("Locus name","Mean missing data (bp)","SD missing data (bp)", "Number of missing loci")

# Write out the table
write_delim(outtable,"missing_data_by_taxa.txt")
