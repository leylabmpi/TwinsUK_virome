#!/bin/bash
#$ -N buildCentrifugeDB
#$ -pe parallel 15
#$ -l h_vmem=4G
#$ -l h_rt=00:30:00
#$ -cwd
#$ -m ea
#$ -M jmoreno@tuebingen.mpg.de

OUT_DIR=/ebio/abt3_projects/TwinsUK_viromes_Shao_Pei/tmp2/0X_contigAnnotation/centrifugeDatabase

/ebio/abt3_projects/TwinsUK_viromes_Shao_Pei/Programs/centrifuge/centrifuge-build -p 15 --conversion-table $OUT_DIR/seqid2taxid.map --taxonomy-tree $OUT_DIR/taxonomy/nodes.dmp --name-table $OUT_DIR/taxonomy/names.dmp $OUT_DIR/input-sequences.viral.fna $OUT_DIR/viral