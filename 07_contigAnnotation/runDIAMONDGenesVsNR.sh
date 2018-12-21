#!/bin/bash
#$ -N diamondNR
#$ -pe parallel 50
#$ -l h_vmem=8G
#$ -l h_rt=72:00:00
#$ -cwd
#$ -m ea
#$ -M jmoreno@tuebingen.mpg.de

IN_DIR=/ebio/abt3_projects/TwinsUK_viromes_Shao_Pei/tmp2
OUT_DIR=/ebio/abt3_projects/TwinsUK_viromes_Shao_Pei/tmp2/0X_contigAnnotation

#/ebio/abt3_projects/TwinsUK_viromes_Shao_Pei/Programs/diamond/diamond makedb --in $IN_DIR/0X_contigAnnotation/ncbiNRdatabase/nr -d $OUT_DIR/ncbiNRdatabase/nrDIAMOND
#echo "database created..."

#/ebio/abt3_projects/TwinsUK_viromes_Shao_Pei/Programs/diamond/diamond blastp --threads 50 -d $OUT_DIR/ncbiNRdatabase/nrDIAMOND -q $IN_DIR/00_Genes/Combined_InteMAP_pp_contigs.fa_LargerThan500.faa_USEDForDiamond -o $OUT_DIR/contigGenesVsNR.diamond --outfmt 100 --max-target-seqs 25 --evalue 1e-5 
/ebio/abt3_projects/TwinsUK_viromes_Shao_Pei/Programs/diamond/diamond blastp --threads 50 -d $OUT_DIR/ncbiNRdatabase/nrDIAMOND -q $IN_DIR/00_Genes/Combined_InteMAP_pp_contigs.fa_LargerThan500.faa_USEDForDiamond -o $OUT_DIR/contigGenesVsNR.diamond --outfmt 6 qseqid stitle bitscore --max-target-seqs 25 --evalue 1e-5 