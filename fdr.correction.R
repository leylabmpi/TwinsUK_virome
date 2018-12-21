Inputs<-commandArgs(trailingOnly=TRUE)

#Read files
pValues <- read.table(Inputs[1],sep='\t',header=F) #"matrix.counts.readsXContigs.rpkm.transposed.txt"

#calculate several hypothesuis correction
holm <- p.adjust(pValues$V1,method="holm")
hochberg <- p.adjust(pValues$V1,method="hochberg")
hommel <- p.adjust(pValues$V1,method="hommel")
bonferroni <- p.adjust(pValues$V1,method="bonferroni")
bh <- p.adjust(pValues$V1,method="BH")
by <- p.adjust(pValues$V1,method="BY")
fdr <- p.adjust(pValues$V1,method="fdr")

#Write output
output <- t(data.frame(rbind(holm,hochberg,hommel,bonferroni,bh,by,fdr)))
write.csv(output,"hypoCorrection.csv")
