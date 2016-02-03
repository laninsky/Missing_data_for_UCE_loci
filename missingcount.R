library("stringr")

intable <- read.table("count",header=FALSE,stringsAsFactors=FALSE,sep="\t")

rows <- dim(intable)[1]

# Change no_taxa to 2 * the number of taxa you have, e.g. this is for 23 samples
no_taxa <- 46

to_write <- matrix(NA,ncol=1,nrow=no_taxa)
to_write[1,1] <- intable[1,1]

to_write_title <- 2
sequencepaste <- NULL

for (j in 2:rows) {
if ((length(grep(">",intable[j,1])))>0) {
to_write_seq <- to_write_title
to_write_title <- to_write_title + 1
to_write[to_write_seq,1] <- sequencepaste
to_write[to_write_title,1] <- intable[j,1]
to_write_title <- to_write_title + 1
sequencepaste <- NULL
} else {
sequencepaste <- paste(sequencepaste,intable[j,1],sep="")
}
}

to_write[no_taxa,1] <- sequencepaste

to_write_temp <- matrix(NA,ncol=2,nrow=(no_taxa/2))

rows <- dim(to_write_temp)[1]
x <- 1
j <- 1

while (j <= rows) {
to_write_temp[j,1] <-  to_write[x,1]
to_write_temp[j,2] <-  str_count(to_write[(x+1),1],fixed("?"))
to_write_temp[j,2] <-  as.numeric(to_write_temp[j,2]) + str_count(to_write[(x+1),1],fixed("-"))
x <- x + 2
j <- j + 1
}

to_write_temp <- to_write_temp[order(to_write_temp[,1]),]

write.table(to_write_temp, "summary",quote=FALSE, col.names=FALSE,row.names=FALSE,append=TRUE)

q()
