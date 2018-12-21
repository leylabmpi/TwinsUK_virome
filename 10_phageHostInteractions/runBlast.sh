#!/bin/bash
#$ -N blastSearch
#$ -pe parallel 4
#$ -l h_vmem=4G
#$ -l h_rt=72:00:00
#$ -cwd
#$ -m ea
#$ -M jmoreno@tuebingen.mpg.de

#makeblastdb -parse_seqids -in /ebio/abt3_projects/TwinsUK_viromes_Shao_Pei/tmp2/01_Derep/allContigs.DeRep.fna -dbtype nucl -out /ebio/abt3_projects/TwinsUK_viromes_Shao_Pei/tmp2/10_contaminants/pilecr/allContigs.Derep.blastDB
blastn -task blastn-short -db /ebio/abt3_projects/TwinsUK_viromes_Shao_Pei/tmp2/10_contaminants/pilecr/allContigs.Derep.blastDB -query /ebio/abt3_projects/TwinsUK_viromes_Shao_Pei/tmp2/10_contaminants/pilecr/spacers.fna -outfmt "6 qseqid pident saccver stitle staxids qlen slen qstart qend sstart send length bitscore gaps evalue" -out /ebio/abt3_projects/TwinsUK_viromes_Shao_Pei/tmp2/10_contaminants/pilecr/blastOutput.csv -max_target_seqs 25 -num_threads 4