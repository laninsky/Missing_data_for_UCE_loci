intable <- read.table("summary",header=FALSE,stringsAsFactors=FALSE,sep=" ")

#Make this the actual number of taxa you have (not 2N)
no_taxa <- 24

ncols <- ((dim(intable)[1])/no_taxa)+1

to_record <- matrix(NA,ncol=ncols,nrow=no_taxa)

to_record[,1] <- intable[1:no_taxa,1]
to_record[,2] <- intable[1:no_taxa,2]

for (j in 3:ncols) {
begin <- ((j-2)*no_taxa)+1
endit <- begin+no_taxa-1
to_record[,j] <- intable[begin:endit,2]
}

rm(intable)

for (j in 1:no_taxa) {
printmean <- mean(as.numeric(to_record[j,2:ncols]))
printsd <- sd(as.numeric(to_record[j,2:ncols]))
toprint <- paste("For ",to_record[j,1],": mean=",printmean,", sd=",printsd,sep="")
print(noquote(toprint))
}

q()
