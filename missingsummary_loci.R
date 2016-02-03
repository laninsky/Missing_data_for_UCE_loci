intable <- read.table("summary",header=FALSE,stringsAsFactors=FALSE,sep=" ")
locinames <- read.table("fasta_names",header=FALSE,stringsAsFactors=FALSE,sep=" ")

#Make this the actual number of taxa you have (not 2N)
no_taxa <- 23
noloci <- dim(locinames)[1]

outtable <- matrix(NA,ncol=2,nrow=noloci)
outtable[,1] <- locinames[,1]

for (i in 1:noloci) {
beginning <- (i-1)*no_taxa+1
end <- beginning+no_taxa-1
outtable[i,2] <- sum(intable[beginning:end,2])
}

write.table(outtable, "locus_missing_data.txt",quote=FALSE, col.names=FALSE,row.names=FALSE)

q()
