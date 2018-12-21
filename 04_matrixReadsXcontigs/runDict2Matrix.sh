#!/bin/bash
#
#$ -N dict2matrix
#$ -l h_vmem=4G
#$ -l h_rt=01:00:00
#$ -cwd

export PATH=/ebio/abt3_projects/TwinsUK_viromes_Shao_Pei/anaconda3/bin:$PATH
source activate py2_leo

python /ebio/abt3_projects/TwinsUK_viromes_Shao_Pei/code/dicts2CountsMatrix.py /ebio/abt3_projects/TwinsUK_viromes_Shao_Pei/tmp2/04_matrixReadsXcontigs/npyCounts/