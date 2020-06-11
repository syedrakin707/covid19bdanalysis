# -*- coding: utf-8 -*-
"""

@author: Admin
"""
import pandas as pd
import numpy as np 
import matplotlib.pyplot as plt

#In case we have to use KNN
from sklearn.preprocessing import MinMaxScaler
from sklearn.metrics import mean_squared_error
from sklearn.metrics import mean_absolute_error
scaler = MinMaxScaler(feature_range=(0, 1))

#In case we have to use Auto Arima
from pmdarima.arima import auto_arima

from matplotlib.pylab import rcParams
rcParams['figure.figsize'] = 20,10

df = pd.read_csv("Dataset-COVID-Bangladesh.csv")
##print(df.head())

#setting index as date
df['DATE'] = pd.to_datetime(df.DATE,format='%d-%m-%y')
df.index = df['DATE']

#plot
plt.figure(figsize=(16,8))
plt.title('Cumulative Deaths in Bangladesh (Used Auto Arima)')

data = df.sort_index(ascending=True, axis=0)
new_data = pd.DataFrame(index=range(0,len(df)),columns=['DATE', 'CURED_CF_CIP'])

##print(new_data)
for i in range(0,len(data)):
     new_data['DATE'][i] = data['DATE'][i]
     new_data['CURED_CF_CIP'][i] = data['CURED_CF_CIP'][i]
     
new_data['DATE'] = pd.to_datetime(new_data.DATE,format='%d-%m-%y')
##print(new_data)

# splitting into train and validation
train = new_data[:76]
valid = new_data[76:]


training = train['CURED_CF_CIP']
validation = valid['CURED_CF_CIP']

# shapes of training set
##print('\n Shape of training set:')
##print(train.shape)
##print(train)
train.index = train['DATE']

# shapes of validation set
##print('\n Shape of validation set:')
##print(valid.shape)
##print(valid)
valid.index = valid['DATE']

#------------------------------#
#MODEL 1 (start_p=1, start_q=1,max_p=3, max_q=3, d=1)
model_1 = auto_arima(training, start_p=1, start_q=1,max_p=3, max_q=3, m=3,start_P=0, seasonal=False,d=1, D=1, trace=True,error_action='ignore',suppress_warnings=True)
model_1.fit(training)
forecast_1 = model_1.predict(n_periods=10)
forecast_1 = pd.DataFrame(forecast_1,index = valid.index,columns=['PRED'])

plt.figure(1)
plt.subplot(2,1,1)
plt.plot(train['CURED_CF_CIP'], color='b', label='% Inc. of Cumulative Recoveries (Trained Data)')
plt.plot(valid['CURED_CF_CIP'], color='y', label='% Inc. of Cumulative Recoveries (Validation Data Pre ARIMA)')
plt.plot(forecast_1['PRED'], color='r', label='% Inc. of Cumulative Recoveries (Forecast Data Post ARIMA - Model 1)')
plt.legend()


valid_num = np.array(valid['CURED_CF_CIP'])
forecast_1_num = np.array(forecast_1['PRED'])
indexing_num = np.arange(10)
print('mse (sklearn): ', mean_squared_error(valid_num[0:10],forecast_1_num[0:10]))
print('mae (sklearn): ', mean_absolute_error(valid_num[0:10],forecast_1_num[0:10]))
print('mape: ', np.mean(np.abs((valid_num[0:10]-forecast_1_num[0:10])/valid_num[0:10]))*100)
plt.subplot(2,1,2)
plt.plot(indexing_num, (valid_num[0:10]-forecast_1_num[0:10])/valid_num[0:10])
plt.show()

#MODEL 2 (start_p=1, start_q=1,max_p=3, max_q=3, d=2)
model_2 = auto_arima(training, start_p=1, start_q=1,max_p=4, max_q=4, m=3,start_P=0, seasonal=False,d=2, D=1, trace=True,error_action='ignore',suppress_warnings=True)
model_2.fit(training)
forecast_2 = model_2.predict(n_periods=10)
forecast_2 = pd.DataFrame(forecast_2,index = valid.index,columns=['PRED'])

plt.figure(2)
plt.subplot(2,1,1)
plt.plot(train['CURED_CF_CIP'], color='b', label='% Inc. of Cumulative Recoveries (Trained Data)')
plt.plot(valid['CURED_CF_CIP'], color='y', label='% Inc. of Cumulative Recoveries (Validation Data Pre ARIMA)')
plt.plot(forecast_2['PRED'], color='r', label='% Inc. of Cumulative Recoveries (Forecast Data Post ARIMA - Model 2)')
plt.legend()


valid_num = np.array(valid['CURED_CF_CIP'])
forecast_2_num = np.array(forecast_2['PRED'])
indexing_num = np.arange(10)
print('mse (sklearn): ', mean_squared_error(valid_num[0:10],forecast_2_num[0:10]))
print('mae (sklearn): ', mean_absolute_error(valid_num[0:10],forecast_2_num[0:10]))
print('mape: ', np.mean(np.abs((valid_num[0:10]-forecast_2_num[0:10])/valid_num[0:10]))*100)
plt.subplot(2,1,2)
plt.plot(indexing_num, (valid_num[0:10]-forecast_2_num[0:10])/valid_num[0:10])
plt.show()

#MODEL 3 (start_p=2, start_q=2,max_p=5, max_q=5, d=2 , seasonal = True)
model_3 = auto_arima(training, start_p=2, start_q=2,max_p=5, max_q=5, m=3,start_P=0, seasonal=True,d=2, D=1, trace=True,error_action='ignore',suppress_warnings=True)
model_3.fit(training)
forecast_3 = model_3.predict(n_periods=10)
forecast_3 = pd.DataFrame(forecast_3,index = valid.index,columns=['PRED'])

plt.figure(3)
plt.subplot(2,1,1)
plt.plot(train['CURED_CF_CIP'], color='b', label='% Inc. of Cumulative Recoveries (Trained Data)')
plt.plot(valid['CURED_CF_CIP'], color='y', label='% Inc. of Cumulative Recoveries (Validation Data Pre ARIMA)')
plt.plot(forecast_3['PRED'], color='r', label='% Inc. of Cumulative Recoveries (Forecast Data Post ARIMA - Model 3)')
plt.legend()


valid_num = np.array(valid['CURED_CF_CIP'])
forecast_3_num = np.array(forecast_3['PRED'])
indexing_num = np.arange(10)
print('mse (sklearn): ', mean_squared_error(valid_num[0:10],forecast_3_num[0:10]))
print('mae (sklearn): ', mean_absolute_error(valid_num[0:10],forecast_3_num[0:10]))
print('mape: ', np.mean(np.abs((valid_num[0:10]-forecast_3_num[0:10])/valid_num[0:10]))*100)
plt.subplot(2,1,2)
plt.plot(indexing_num, (valid_num[0:10]-forecast_3_num[0:10])/valid_num[0:10])
plt.show()