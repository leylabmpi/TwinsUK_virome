library("betapart")
library("vegan")
getwd()

Inputs<-commandArgs(trailingOnly=TRUE)
matrix <- read.table(Inputs[1],sep='\t',header=T,row.names=1) #"matrix.counts.readsXContigs.rpkm.transposed.taxt

dist <- bray.part(matrix)

turnOver <- dist[[1]]
nestedness <- dist[[2]]
all <- dist[[3]]

write.csv(as.matrix(turnOver),"betaBray.turnover.csv")
write.csv(as.matrix(nestedness),"betaBray.nestedness.csv")
write.csv(as.matrix(all),"betaBray.all.csv")
