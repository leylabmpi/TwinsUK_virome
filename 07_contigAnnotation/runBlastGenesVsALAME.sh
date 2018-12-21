#!/bin/bash
#$ -N blastACLAME
#$ -pe parallel 6
#$ -l h_vmem=4G
#$ -l h_rt=72:00:00
#$ -cwd
#$ -m ea
#$ -M jmoreno@tuebingen.mpg.de

IN_DIR=/ebio/abt3_projects/TwinsUK_viromes_Shao_Pei/tmp2
OUT_DIR=/ebio/abt3_projects/TwinsUK_viromes_Shao_Pei/tmp2/0X_contigAnnotation

blastp -db $OUT_DIR/aclame_proteins_viruses_prophages_0.4 -query $IN_DIR/00_Genes/Combined_InteMAP_pp_contigs.fa_LargerThan500.faa_USEDForDiamond -outfmt "6 qseqid pident saccver stitle staxids qlen slen qstart qend sstart send length bitscore gaps evalue" -out contigGenesVsACLAME.tsv -evalue 1e-5 -num_threads 6 