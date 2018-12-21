
# coding: utf-8
__author__ = "Leonardo Moreno"
__copyright__ = ""
__credits__ = []
__license__ = ""
__version__ = "1.0.1"
__maintainer__ = "Leonardo Moreno"
__email__ = "lemoga.inv@gmail.com"
__status__ = "Production"

"""
coverageMatrixFromSamBamCoverage
Given: coverageFile, referencesLengths, binSize, outFile
Return: coverageMatrix 
"""

# In[65]:

import pandas as pd
import numpy as np
import sys

# Import coverage File
coverageFile = pd.read_csv(sys.argv[1],sep='\t',header=None)#"5.coverageFiles.bacteria/Ab1.1.q20.coverage"
coverageFile.columns = ["REFERENCE","POS","DEPTH"]

# Import length to coverage table
referenceLengths =  pd.read_csv(sys.argv[2],sep='\t',header=None)#"0.bacterialGenomes/BacterialGenomes.length.txt"
referenceLengths.columns = ["REFERENCE","LENGTH"]
referenceLengths.set_index("REFERENCE",inplace=True)


# Initialize the matrix
#Create a matrix of size #refinCov X #bins.
#The number of bins is determinated by the largest reference
binSize = float(sys.argv[3])#100000.0
numBins = int(np.ceil(max(referenceLengths["LENGTH"])/binSize))
abundanceMatrix = pd.DataFrame(data=np.zeros((coverageFile["REFERENCE"].unique().shape[0],numBins)),
                               index=coverageFile["REFERENCE"].unique(),columns=range(1,numBins+1))

#Fill abundance matrix with coverage values
for index,row in coverageFile.iterrows():
    abundanceMatrix.loc[row["REFERENCE"]][int(np.ceil(row["POS"]/binSize))] += row["DEPTH"]

#Save the matrix
abundanceMatrix.to_csv(sys.argv[4],sep='\t',header=True,index=True)
