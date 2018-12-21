library("betapart")
library("vegan")
getwd()

Inputs<-commandArgs(trailingOnly=TRUE)
matrix <- read.table(Inputs[1],sep='\t',header=T,row.names=1) #"matrix.counts.readsXContigs.rpkm.transposed.taxt
matrix <- decostand(matrix,method="pa")

dist <- beta.pair(matrix, index.family="jaccard")

turnOver <- dist[[1]]
nestedness <- dist[[2]]
all <- dist[[3]]

write.csv(as.matrix(turnOver),"betaJaccard.turnover.csv")
write.csv(as.matrix(nestedness),"betaJaccard.nestedness.csv")
write.csv(as.matrix(all),"betaJaccard.all.csv")
