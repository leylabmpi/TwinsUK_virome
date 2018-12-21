#!/bin/bash
#$ -N muscleProfile
#$ -l h_vmem=4G
#$ -l h_rt=24:00:00
#$ -cwd
#$ -m ea
#$ -M jmoreno@tuebingen.mpg.de

OUTFOLDER="/ebio/abt3_projects/TwinsUK_viromes_Shao_Pei/tmp2/06_hmmAnnotation/microviridae/"
muscle -profile -in1 $OUTFOLDER"mAlignQuery.fa" -in2 $OUTFOLDER"mAlignReference.fa" -out $OUTFOLDER"mAlignReferenceAndQuery.fa"
muscle -profile -in1 $OUTFOLDER"mAlignReferenceAndQuery.fa" -in2 $OUTFOLDER"mAlignOutGroup.fa" -out $OUTFOLDER"mAlignReferenceAndQueryAndOutGroup.fa"