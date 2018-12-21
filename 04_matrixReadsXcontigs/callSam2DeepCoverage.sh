ls /ebio/abt3_projects/TwinsUK_viromes_Shao_Pei/tmp2/04_matrixReadsXcontigs/*.sam | while read -r samFile
do
        #echo $samFile
        qsub -v FOO=$samFile runSam2Dict.sh
done