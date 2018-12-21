library(vegan)
library(plyr)
getwd()

Inputs<-commandArgs(trailingOnly=TRUE)

#Read files
#matrix <- read.table("../../testCleanReads2/matrix.counts.readsXContigs.rpkm.byMappedClean.transposed.txt",sep='\t',header=T,row.names=1) #"matrix.counts.readsXContigs.rpkm.transposed.txt"
matrix <- read.table(Inputs[1],sep='\t',header=T,row.names=1) #"matrix.counts.readsXContigs.rpkm.transposed.txt"
matrix <- t(matrix)
#matrix <- matrix+1
#matrix <- log10(matrix)

#alpha diversity
alphaShannon <- diversity(matrix, index="shannon", base=2)
alphaSimpson <- diversity(matrix, index="simpson", base=2)
outAlpha <- t(data.frame(rbind(alphaShannon,alphaSimpson)))

#beta diversity
betaBray <- vegdist(matrix,method="bray",binary=F)
betaJaccard <- vegdist(matrix,method="jaccard",binary=T)
betaHellinger <- vegdist(decostand(matrix, method="hellinger"),method="euclidean",binary=F)

#Write outputs
write.csv(outAlpha,"alphaDiversity.csv")
write.csv(as.matrix(betaBray),"betaBray.csv")
write.csv(as.matrix(betaJaccard),"betaJaccard.csv")
write.csv(as.matrix(betaHellinger),"betaHellinger.csv")
#write.csv(as.matrix(matrix),"../../testCleanReads2/matrix.counts.readsXContigs.rpkm.byMappedClean.log.txt")
