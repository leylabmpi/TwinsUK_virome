library(Rsubread)
setwd("/ebio/abt3_projects/TwinsUK_viromes_Shao_Pei/tmp2/03_readsToDeRepContigs")
Inputs<-commandArgs(trailingOnly=TRUE)

#Build index
buildindex(basename="referenceIndex",reference=Inputs[1])#allContigs.Derep.fna