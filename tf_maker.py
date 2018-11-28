#%% [markdown]
# # Starter Classes
# 
# These are classes that will be used throughout the project. 

#%%
#All neccesary classes for project

#general
import seaborn as sns
import pandas as pd
import numpy as np
import scipy.stats as ss

#for preprocessing
from sklearn.model_selection import StratifiedShuffleSplit
from sklearn.model_selection import ShuffleSplit
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import StandardScaler
from sklearn.preprocessing import Imputer
from sklearn.pipeline import FeatureUnion

#for machine learning
from sklearn.ensemble import RandomForestClassifier
from sklearn.ensemble import RandomForestRegressor
from sklearn.metrics import mean_squared_error
from sklearn.model_selection import cross_val_score
from sklearn.model_selection import GridSearchCV
from sklearn.model_selection import RandomizedSearchCV
from scipy.stats import expon, reciprocal
from sklearn.svm import SVR

#for evaluation
from sklearn.metrics import confusion_matrix
from sklearn.metrics import f1_score

#for utility packages
from Utilities.utilities import import_data
from Utilities.utilities import DataFrameSelector
from Utilities.utilities import CategoricalEncoder
from Utilities.utilities import display_scores

import matplotlib.pyplot as plt

#%% [markdown]
# # Import Data
# 
# Here we will import the data, view it, and scale it as well as impute missing values

#%%
#Get Data

raw_data = import_data("Out_Of_Set_Test_Run_2.csv", "C:/Users/sdgeo/Dropbox/Own/Graduate-School/First_Semester/COMP_790/workspace/out_of_sample")
cleaned_data = raw_data.drop(['Unnamed: 0'], axis=1)
unblurred_data = cleaned_data.loc[cleaned_data['Correct_Confidence'] == 0].reset_index().drop(['index'], axis=1)
blurred_data = cleaned_data.loc[cleaned_data['Correct_Confidence'] == 1].reset_index().drop(['index'], axis=1)
classfier_compare = unblurred_data.iloc[:,[4,6]]
blur_compare = blurred_data.iloc[:,[4,6]]
confidence_compare = cleaned_data.iloc[:,[8,10]]
unblurred_data.to_csv('Unblurred_Data_Compare.csv', sep=',')
cleaned_data

#%% [markdown]
# # Ready for Plotting and Graphing
# 
# Here you can use can visualize data and do any number of correlation matricies etc. 
# 
# Cleaned data item:
# cleaned_data

#%%

cleaned_data.info()


#%%
cleaned_data.describe()


#%%
get_ipython().run_line_magic('matplotlib', 'inline')
import matplotlib.pyplot as plt
cleaned_data.reindex(sorted(cleaned_data.columns), axis=1)
cleaned_data.hist(bins=50, figsize=(150,130))
plt.savefig('hist_2.jpeg')
plt.show()


#%%
corr_matrix = cleaned_data.corr()


#%%
corr_matrix_spear = cleaned_data.corr(method='spearman')
corr_matrix_spear.reindex(sorted(corr_matrix_spear.columns), axis=1)
pvalue_matrix_spear = pd.DataFrame(ss.spearmanr(cleaned_data).pvalue)
corr_matrix_spear


#%%

#color pallete used for all heatmaps
pls = sns.husl_palette(8, s=.45)

#overall cluster map
dims = (100, 100)
sns_whole = sns.clustermap(corr_matrix_spear, figsize=dims, cmap="vlag")
sns_whole.savefig("correlation_map.png", dpi = 'figure')


#%%
get_ipython().run_line_magic('matplotlib', 'inline')
cleaned_data.plot(kind="scatter", x="Confidence_Score", y="Correct_Softmax_Value", alpha=0.1)
plt.savefig('Correlation_Correct_Softmax.jpeg')
plt.show()


#%%
get_ipython().run_line_magic('matplotlib', 'inline')
cleaned_data.plot(kind="scatter", x="Confidence_Score", y="Estimated_Category_Strength", alpha=0.1)
plt.savefig('Correlation_Strongest_Category.jpeg')
plt.show()


#%%
confidence_compare


#%%
#Calculate Classifier Accuracy

confidence_matrix = classfier_compare.as_matrix()
left = confidence_matrix[:, [0]]
left = np.reshape(left, 1500,0)

right = confidence_matrix[:, [1]]
right = np.reshape(right,1500,0)

in_common = 0
for i in range(len(confidence_matrix)):
    if right[i] == left[i]:
        in_common = in_common + 1

accuracy = in_common/len(confidence_matrix)
accuracy


#%%
#Calculate in/out Accuracy

confidence_matrix = confidence_compare.as_matrix()
left = confidence_matrix[:, [0]]
left = np.reshape(left, 3000,0)

right = confidence_matrix[:, [1]]
right = np.reshape(right,3000,0)

in_common = 0
for i in range(len(confidence_matrix)):
    if right[i] == left[i]:
        in_common = in_common + 1

accuracy = in_common/len(confidence_matrix)
accuracy


#%%
#Calculate in/out Accuracy

confidence_matrix = blur_compare.as_matrix()
left = confidence_matrix[:, [0]]
left = np.reshape(left, 1500,0)

right = confidence_matrix[:, [1]]
right = np.reshape(right,1500,0)

in_common = 0
for i in range(len(confidence_matrix)):
    if right[i] == left[i]:
        in_common = in_common + 1

accuracy = in_common/len(confidence_matrix)
accuracy


