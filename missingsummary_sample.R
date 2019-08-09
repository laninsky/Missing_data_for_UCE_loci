# Loading in require libraries
library("tidyverse")

# Reading in the intermediate summary file
intable <- read_table2("summary",col_names=FALSE)

# Summarizing the data
outtable <- intable %>% group_by(X1) %>% summarise(mean_missing_bp=mean(X2),sd_missing_bp=sd(X2))
names(outtable) <- c("Sample name","Mean missing data (bp)","SD missing data (bp)")

# Write out the table
write_delim(outtable,"missing_data_by_sample.txt")
