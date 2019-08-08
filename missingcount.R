library("tidyverse")

# Read in the data, get the total number of rows
intable <- read_table("count",col_names=FALSE)
rows <- dim(intable)[1]

# Get the number of taxa in the fasta file
notaxa <- (intable %>% filter(grepl(">",X1)) %>% dim())[1]

# Set up the intermediate matrix to calculate the missing data off 
onelined <- matrix(NA,ncol=2,nrow=notaxa)
onelined[,1] <- as.matrix(intable %>% filter(grepl(">",X1)))
sequencepaste <- NULL
onelined_rowindex <- 1

# Filling in the intermediate matrix with the sequence data
for (j in 2:rows) {
  if ((length(grep(">",intable[j,1])))>0) {
    onelined[onelined_rowindex,1] <- str_count(sequencepaste,fixed("?")) + str_count(sequencepaste,fixed("-"))
    onelined_rowindex <- onelined_rowindex + 1
    sequencepaste <- NULL
  } else {
    sequencepaste <- paste(sequencepaste,intable[j,1],sep="")
  }
}

onelined[(notaxa*2),1] <- sequencepaste


 str_count(to_write[(x+1),1],fixed("-"))
x <- x + 2
j <- j + 1
}

to_write_temp <- to_write_temp[order(to_write_temp[,1]),]

write.table(to_write_temp, "summary",quote=FALSE, col.names=FALSE,row.names=FALSE,append=TRUE)

q()
