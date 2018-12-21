#!/bin/bash
#$ -N searchCrAssphage
#$ -l h_vmem=4G
#$ -l h_rt=24:00:00
#$ -cwd
#$ -m ea
#$ -M jmoreno@tuebingen.mpg.de

OUTFOLDER="/ebio/abt3_projects/TwinsUK_viromes_Shao_Pei/tmp2/06_hmmAnnotation/crAss/"
hmmsearch -o $OUTFOLDER"MCP.hmmSearch.output" $OUTFOLDER"MCP.crAss.hmm" $OUTFOLDER"../../05_abundanceDistributions/Combined_InteMAP_pp_contigs.fa_LargerThan500.ForAlpha.faa"