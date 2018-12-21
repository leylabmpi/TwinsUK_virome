#!/bin/bash
#$ -N diamondP
#$ -l h_vmem=8G
#$ -pe parallel 10
#$ -l h_rt=02:00:00
#$ -cwd
#$ -m ea
#$ -M jmoreno@tuebingen.mpg.de

line=$FOO
eval $line