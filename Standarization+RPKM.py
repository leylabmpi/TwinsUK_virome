
# coding: utf-8

# In[1]:

import numpy as np
import pandas as pd
import sys

# # Import Data

# In[2]:

#Contig Lengths
contigLengths = {}
with open(sys.argv[1]) as fr: #"../Diamond/allContigs.DeRep_len.txt"
    for line in fr:
        line = line.strip('\n').split('\t')
        contigLengths[line[0]] = int(line[1])
contigLengths_pandas = pd.Series(contigLengths)
contigLengths_pandas = contigLengths_pandas.sort_index()


# In[3]:

#Mapping File
mapping = pd.read_csv(sys.argv[2], header=0, sep='\t', index_col=0) #"../48MZ_Virome_Metadata.csv"


# In[4]:

#Abundance Matrix
matrix = pd.read_csv(sys.argv[3], header=0, index_col=0, sep='\t') #'matrix.coverage.readsXgenes.txt'
matrix = matrix.sort_index()


# # Standarization

# In[5]:

#RM*10^9/totalReads
matrix *= 1000000000
rpm = matrix.div(mapping[sys.argv[4]], axis=0)#MappingReadsAfterClean (Name of the column which contain the number of reads to normalize)


# In[6]:

#get Contigs in Matrix
contigLengths = contigLengths_pandas[rpm.columns.values]
contigLengths = contigLengths.sort_index()
#Transpose for operate
rpm = rpm.T
rpm = rpm.sort_index()
#RM*10^9/totalReads*len
rpkm = rpm.div(contigLengths,axis=0)
rpkm = rpkm.T


# In[7]:

rpkm.to_csv("matrix.counts.readsXContigs.rpkm.txt",header=True,index=True,sep="\t")

