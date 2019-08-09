# Loading in require libraries
library("tidyverse")

# Reading in the intermediate summary file
intable <- read_table2("summary",col_names=FALSE)

# Summarizing the data
no_taxa <- length(as.matrix(unique(intable$X1)))

outtable <- intable %>% group_by(X3) %>% 
  summarise(mean_missing_bp=mean(X2),sd_missing_bp=sd(X2),no_missing_taxa=(no_taxa-length(unique(X1))))

names(outtable) <- c("Locus name","Mean missing data (bp)","SD missing data (bp)", "Number of missing taxa")

# Write out the table
write_delim(outtable,"missing_data_by_locus.txt")
