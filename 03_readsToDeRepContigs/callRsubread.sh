cat runMapreads.list.txt | while read -r line
do 
    qsub -v FOO="$line" runRsubread.sh
done