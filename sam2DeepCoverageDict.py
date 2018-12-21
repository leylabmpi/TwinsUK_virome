
# coding: utf-8

# In[2]:

import numpy as np
import pandas as pd
import sys


# In[43]:

t1 = pd.read_csv(sys.argv[1], header=-1,index_col=None, sep='\t')#"T1_properlyPaired.sam"
header=["QNAME","FLAG","RNAME","POS","MAPq","CIGAR","RNEXT","PNEXT","TLEN","SEQ","QUAL","META1","META2","META3"]
t1.columns = header
#pd.DataFrame.head(t1,10)


# # Sort reads & Remove chimeras

# In[44]:

#t2 = t1[t1["TLEN"]!=0]
t2 = t1.copy()
t3 = t2.sort_values(by="QNAME", axis=0)
#print t1.shape, t2.shape, t3.shape


# # Make dictionary counts

# In[45]:

genes = {}
for index,row in t3.iterrows():
    if row['RNAME'] in genes:
        genes[row['RNAME']] += 1
    else:
        genes[row['RNAME']] = 1


# # Save Dictionary

# In[46]:
out = sys.argv[1].split("/")[-1].split("_")[0]+".dict.count.npy"
np.save(out, genes)


# # Make dictionary (Vertical Coverage)

# In[47]:
"""
I COMMENT THIS BECAUSE WE DECIDE TO USE THE COUNTS MATRIX AND NOT THE COVERAGE MATRIX
THERE IS NO DIFFERENCE BETWEEN BOTH AND THE STANDARD ONE (ACCEPTED FOR THE SCIENTIFIC COMMUNITY) IS COUNTS
contigLengths = {}
with open(sys.argv[2]) as fr:#"allContigs.DeRep_len.txt"
    for line in fr:
        line = line.strip('\n').split('\t')
        contigLengths[line[0]] = int(line[1])


# In[48]:

def split_text(s):
    #Taken from
    #http://stackoverflow.com/questions/12409894/fast-way-to-split-alpha-and-numeric-chars-in-a-python-string
    from itertools import groupby
    for k,g in groupby(s, str.isalpha):
        yield ''.join(list(g))


# In[49]:

def applyAlignment(gene, posIni, numPB, op, first):
    pos = posIni - 1
    if op in ["D","N","S","H","X"]:
        if first == False:
            pos += numPB
    elif op in ["M","="]:
        for i in range(pos,pos+numPB):
            gene[i]+=1
        pos += numPB
    return gene, pos
#if op in ["I","P"]: gene doesn change


# In[50]:

genes = {}
for index,row in t3.iterrows():
    if row['RNAME'] in genes:
        gene = genes[row['RNAME']]
        posIni = row['POS']-1
        sense = row['TLEN']>0
        cigar = [x for x in split_text(row['CIGAR'])]
        i=0
        first = True
        while i < len(cigar):
            gene, posIni = applyAlignment(gene,posIni,int(cigar[i]),cigar[i+1],first)
            first = False
            i+=2
        genes[row['RNAME']] = gene
    else:
        gene = np.zeros(contigLengths[row['RNAME']])
        posIni = row['POS']-1
        cigar = [x for x in split_text(row['CIGAR'])]
        i=0
        first = True
        while i < len(cigar):
            gene, posIni = applyAlignment(gene,posIni,int(cigar[i]),cigar[i+1],first)
            firts = False
            i+=2
        genes[row['RNAME']] = gene



# # Save Dictionary

# In[51]:

out = sys.argv[1].split("/")[-1].split('_')[0] + ".dict.coverage.npy"
np.save(out, genes)
"""
