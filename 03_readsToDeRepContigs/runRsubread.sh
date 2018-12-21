#!/bin/bash
#$ -N subread
#$ -l h_vmem=4G
#$ -pe parallel 6
#$ -l h_rt=06:00:00
#$ -m ea
#$ -M jmoreno@tuebingen.mpg.de
#$ -cwd

export PATH=/ebio/abt3_projects/TwinsUK_viromes_Shao_Pei/anaconda3/bin:$PATH
source activate py2_leo
line=$FOO
eval $line