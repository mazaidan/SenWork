#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Aug 23 11:06:36 2021

@author: zaidanma
"""

#%% Load necessary libraries

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np


#%% We read data from Nanjing Sensor Network Data:
    
xls = pd.ExcelFile('DATA/2021_Mar-Jul_AQData_Gulou_district.xlsx')
SheetNames = xls.sheet_names  # see all sheet names
#xls.parse(SheetNames)  # read a specific sheet to DataFrame
DATA1       = pd.read_excel(xls, SheetNames[0])
DATA1_label = pd.read_excel(xls, SheetNames[1])


#%% To check the available variables on each sheet
print('DATA1 include:')    
for col in DATA1:
    print(col)    

print('DATA1+label include:')    
for col in DATA1_label:
    print(col)        


#%% Check the data, if any missing data or the types of data

DATA1.info()
DATA1_label.info()

print(DATA1.dtypes)


# From the above informaiton, many data contain 'object", we need
# to change them all to float64, except for cols below: 
cols = DATA1.columns.drop(['qc_datetime','SITE_NAME', '点位名称', '街道名称', 
                              '匹配的点位类型']) # This is better

# Next, we use the "cols" names, to make them 'float'
# Replace blank value with nan and now everything becomes float number
# https://www.geeksforgeeks.org/python-pandas-to_numeric-method/
DATA1[cols] = DATA1[cols].apply(pd.to_numeric, errors='coerce')
print(DATA1.dtypes) 

print(pd.unique(DATA1['CODE']))
print(pd.unique(DATA1['SITE_NAME']))

CODE = pd.unique(DATA1['CODE'])
SITE_NAME = pd.unique(DATA1['SITE_NAME'])


#%% To find index DATA1['CODE'] == nan
# https://stackoverflow.com/questions/14016247/find-integer-index-of-rows-with-nan-in-pandas-dataframe
index = DATA1['CODE'].index[DATA1['CODE'].apply(np.isnan)]

# https://stackoverflow.com/questions/21800169/python-pandas-get-index-of-rows-which-column-matches-certain-value
#L = DATA1['CODE'].index[DATA1['CODE'] == np.float64('nan')].tolist()
#L = DATA1['CODE'].index[DATA1['CODE'] == CODE[74]].tolist()


#%% Try to match between CODE and SITE_NAME
# We need to label SITE_NAME to be something

DATA2 = DATA1.copy()


S1 = [0] * len(DATA2) #list(range(0, len(DATA2)))
DATA2['SITE_NAME_num'] = S1
DATA2['CODE_num'] = S1


n = 0 
for s in SITE_NAME: #DATA2:
    n = n+1
    print(n)
    print(s)
    index = DATA2['SITE_NAME'] == s
    DATA2['SITE_NAME_num'][index] = n
    
n = 0 
for s in CODE: 
    n = n+1
    print(n)
    print(s)
    index = DATA2['CODE'] == s
    DATA2['CODE_num'][index] = n

ax1 = DATA2.plot.scatter(x='CODE',
                       y='SITE_NAME',
                       c='DarkBlue')

ax2 = DATA2.plot.scatter(x='CODE_num',
                       y='SITE_NAME_num',
                       c='DarkBlue')


#%%

# Example:
S = 1
DATA3 =  DATA2.loc[DATA2['SITE_NAME'] == SITE_NAME[S]]
DATA3.info()
DATA3.describe()
'''
# If you wanna to make it in the same Excel sheet
n = 0 
for s in SITE_NAME: 
    n = n+1
    print(n)
    print(s)
    
# https://xlsxwriter.readthedocs.io/example_pandas_multiple.html
'''

sns.set(rc={'figure.figsize':(11, 4)})
sns.set(font_scale=1.5, rc={'text.usetex' : False})
ax = DATA3['PM2_5'].plot(linewidth=0.5);
ax.set_title('PM$_{2.5}$ in ' + SITE_NAME[S])
ax.set_ylabel('PM$_{2.5}$ [$\mu g/m^3$]')
plt.style.use('seaborn')
