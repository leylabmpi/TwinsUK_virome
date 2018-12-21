cat contaminantsVsNR.list.txt | while read -r line
do
    qsub -v FOO="$line" runDiamond.sh
done