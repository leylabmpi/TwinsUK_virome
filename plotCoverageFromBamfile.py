# coding: utf-8

import sys
import pysam
import pandas as pd
import numpy as np
"""
import plotly.plotly as py
#py.sign_in('lemoga', 'tljxTgI7TUZjMSUOtbsP')
import plotly
import plotly.graph_objs as go
#plotly.offline.init_notebook_mode() # run at the start of every notebook
"""

#Import coverage table
coverageFile = pd.read_csv(sys.argv[1],sep='\t',header=None) #"U1.coverage"
coverageFile.columns = ["CONTIG","POS","DEPTH"]
coverageFile.head()

#Get contigs names and contigs lengths from bam/sam header and shape that info into a pd.DataFrame
samfile = pysam.AlignmentFile(sys.argv[2],"rb") #"U1.bam"
contigs = dict(zip(samfile.references,samfile.lengths))
contigs = pd.Series(contigs)
#contig ID is generated just with the purpose of crete a data frame. Yoy need at least 2 columns to create one dataframe
contigsId = pd.Series(data=range(contigs.shape[0]), index=contigs.index.values)
contigs = pd.DataFrame([contigs,contigsId])
contigs = contigs.T
contigs.columns = ["LENGTH","ID"]
contigs.head()

#Add contig length info to coverageFile
coverageFile = pd.merge(coverageFile,contigs,how="inner",left_on="CONTIG",right_index=True)
coverageFile.head()

#initialize abundance matrix in zero
binSize = 100.0
numBins = int(np.ceil(max(coverageFile["LENGTH"])/binSize))
abundanceMatrix = pd.DataFrame(data=np.zeros((coverageFile["CONTIG"].unique().shape[0],numBins)),
                               index=coverageFile["CONTIG"].unique())
abundanceMatrix.head()

#Fill abundance matrix with coverage values
for index,row in coverageFile.iterrows():
    abundanceMatrix.loc[row["CONTIG"]][int(np.ceil(row["POS"]/binSize))] += row["DEPTH"]
#Normalize abundance matrix and put nan values to bins greater than contig size
for index,row in abundanceMatrix.iterrows():
    abundanceMatrix.loc[index][(contigs.loc[index]["LENGTH"]/np.int(binSize))+1:] = np.NAN
abundanceMatrixNormalized = np.log10(abundanceMatrix.add(1,axis=1))
abundanceMatrixNormalized.to_csv(sys.argv[3],header=True,index=True,sep="\t") #"U1.clean.abundanceMatrix.normalized.csv"

#create heatmap
#data = [go.Heatmap(z=abundanceMatrixNormalized.values.tolist(),
#                   y=abundanceMatrixNormalized.index, x=abundanceMatrixNormalized.columns.values,
#                   colorscale="Hot")]
#
#layout = go.Layout(title=sys.argv[3].split('.')[0], width=1000,height=1000,autosize=False)
#fig = go.Figure(data=data, layout=layout)
#plotly.offline.iplot(fig)
#plotly.plotly.image.save_as(fig, sys.argv[4]) #"U1.clean.abundanceMatrix.normalized.pdf"
