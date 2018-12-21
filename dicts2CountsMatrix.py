
# coding: utf-8

# In[2]:

import pandas as pd
import numpy as np

import sys
from os import listdir


# In[4]:

files = listdir(sys.argv[1])#'countsNPY/'
allDicts = []
samplesNames = []
for aFile in files:
    if 'npy' in aFile:
        filename = sys.argv[1]+aFile#'countsNPY/'
        allDicts.append(np.load(filename).item())
        samplesNames.append(aFile.split('.')[0])
print len(allDicts)


# In[8]:

allGenes = set()
for dictionary in allDicts:
    for x in dictionary.keys():
        allGenes.add(x)
allGenes = list(allGenes)


# In[9]:

matrix = pd.DataFrame(np.zeros((len(allDicts),len(allGenes))),index=samplesNames,columns=allGenes)


# In[10]:

for i in range(len(allDicts)):
    for gene in allDicts[i].keys():
        matrix[gene][samplesNames[i]] += allDicts[i][gene]


# In[11]:

#pd.DataFrame.head(matrix)


# In[12]:

matrix.to_csv("matrix.counts.readsXgenes.txt", header=True, index=True, sep='\t')

