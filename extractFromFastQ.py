def extractFromFastQ(fastq,idsFile,outfile):
    #index sequences
    fastqFile = {}
    f = fastq
    for record in SeqIO.parse(f, "fastq"):
        name =  record.id.split('/')[0] #for paired-end reads
        fastqFile[name] = record
    #get sequences of interest
    f = idsFile
    fr = open(f,'r')
    s = []
    for line in fr:
        s.append(fastqFile[line.strip('\n')])
    fr.close()
    #Write output file
    SeqIO.write(s,outfile,"fastq")

if __name__ == '__main__':
    import sys
    from Bio import SeqIO

    fastq = sys.argv[1]
    idsFile = sys.argv[2]
    outfile = sys.argv[3]
    
    extractFromFastQ(fastq,idsFile,outfile)
