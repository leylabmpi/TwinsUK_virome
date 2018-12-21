#!/bin/bash
#$ -N eFQ
#$ -l h_vmem=8G
#$ -l h_rt=00:10:00
#$ -cwd
#$ -m ea
#$ -M jmoreno@tuebingen.mpg.de

export PATH=/ebio/abt3_projects/TwinsUK_viromes_Shao_Pei/anaconda3/bin:$PATH
source activate py2_leo

line=$FOO
eval $line