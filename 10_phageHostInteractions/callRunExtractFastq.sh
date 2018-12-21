cat extractFastq.contaminants.list.txt | while read -r line
do
    qsub -v FOO="$line" runExtractFastq.sh
done