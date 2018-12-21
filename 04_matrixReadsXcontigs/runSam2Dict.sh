#!/bin/bash
#
#$ -N sam2dict
#$ -l h_vmem=16G
#$ -l h_rt=01:00:00
#$ -cwd

export PATH=/ebio/abt3_projects/TwinsUK_viromes_Shao_Pei/anaconda3/bin:$PATH
source activate py2_leo

samFile=$FOO
python /ebio/abt3_projects/TwinsUK_viromes_Shao_Pei/code/sam2DeepCoverageDict.py $samFile /ebio/abt3_projects/TwinsUK_viromes_Shao_Pei/tmp2/01_Derep/allContigs_len.txt