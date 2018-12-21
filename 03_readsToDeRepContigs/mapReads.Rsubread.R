
library(Rsubread)
setwd("/ebio/abt3_projects/TwinsUK_viromes_Shao_Pei/tmp2/03_readsToDeRepContigs")
Inputs<-commandArgs(trailingOnly=TRUE)
#Reads Mapping
#Inputs[1] 8L_PF_scythed_tagcleaned_sickled_Ab1_paired_R1.fastq
#Inputs[2] 8L_PF_scythed_tagcleaned_sickled_Ab1_paired_R2.fastq
align(index="referenceIndex",readfile1=Inputs[1],readfile2=Inputs[2],output_file=Inputs[3],minFragLength=425,maxFragLength=875,phredOffset=33,nthreads=6,input_format="FASTQ",output_format="BAM")#Ab1.bam