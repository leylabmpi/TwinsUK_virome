ls 0.samFiles/*.sam | while read -r samFile
do
        #echo $samFile
        qsub -v FOO=$samFile runSam2Dict.sh
done