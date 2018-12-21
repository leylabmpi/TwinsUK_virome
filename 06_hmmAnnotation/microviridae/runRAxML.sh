#!/bin/bash
#$ -N raxML
#$ -l h_vmem=4G
#$ -l h_rt=48:00:00
#$ -cwd
#$ -m ea
#$ -M jmoreno@tuebingen.mpg.de

OUTFOLDER="/ebio/abt3_projects/TwinsUK_viromes_Shao_Pei/tmp2/06_hmmAnnotation/microviridae/"
raxmlHPC -m PROTCATVT -p 12345 -s $OUTFOLDER"mAlignReferenceAndQueryAndOutGroup.withoutGaps.phylip" -# 20 -n phyloMLVT
raxmlHPC -m PROTCATVT -p 12345 -b 12345 -# 100 -s $OUTFOLDER"mAlignReferenceAndQueryAndOutGroup.withoutGaps.phylip" -n bootstrapping
raxmlHPC -m PROTCATVT -p 18850 -f b -t $OUTFOLDER"RAxML_bestTree.phyloMLVT" -z $OUTFOLDER"RAxML_bootstrap.bootstrapping" -n treeWithSupports