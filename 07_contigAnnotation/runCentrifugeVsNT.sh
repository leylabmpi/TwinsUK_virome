#!/bin/bash
#$ -N centrifuge
#$ -pe parallel 15
#$ -l h_vmem=4G
#$ -l h_rt=01:00:00
#$ -cwd
#$ -m ea
#$ -M jmoreno@tuebingen.mpg.de

IN_DIR=/ebio/abt3_projects/TwinsUK_viromes_Shao_Pei/tmp2
OUT_DIR=/ebio/abt3_projects/TwinsUK_viromes_Shao_Pei/tmp2/0X_contigAnnotation

/ebio/abt3_projects/TwinsUK_viromes_Shao_Pei/Programs/centrifuge/centrifuge -p 15  -f -x $OUT_DIR/centrifugeDatabase/viral $IN_DIR/05_abundanceDistributions/contigs.ForAlpha.fna > $OUT_DIR/contigs.ForAlpha.centrifuge.viral.tsv