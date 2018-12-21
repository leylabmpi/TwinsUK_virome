#!/bin/bash
#$ -N muscleAlgn
#$ -l h_vmem=4G
#$ -l h_rt=24:00:00
#$ -cwd
#$ -m ea
#$ -M jmoreno@tuebingen.mpg.de

OUTFOLDER="/ebio/abt3_projects/TwinsUK_viromes_Shao_Pei/tmp2/06_hmmAnnotation/microviridae/"
muscle -in $OUTFOLDER"VP1indF.faa" -out $OUTFOLDER"mAlignReference.fa"
muscle -in $OUTFOLDER"NewRefMicrovirusProts.faa" -out $OUTFOLDER"mAlignOutGroup.fa"
muscle -in $OUTFOLDER"proteinsWithVP1domain.greaterThan450bp.coverage50.pIdent40.fa" -out $OUTFOLDER"mAlignQuery.fa"