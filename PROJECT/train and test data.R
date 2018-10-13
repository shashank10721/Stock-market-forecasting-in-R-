msft_close.end <- floor(0.81*length(msft_close)) #integer value used for making train and test data  
data_train <- msft_close[1:msft_close.end] #assign the first 81%(or 2000-2015) of the msft_close1 to the train set
data_test <- msft_close[(msft_close.end+1):length(msft_close)] #assign the rest 19%(or 2015-2018) to the test set
msft_close_train = ts(data_train,start = c(2000,1),frequency = 12) #conveting matrix train data to time series data
msft_close_test = ts(data_test,start = c(2015,1),frequency = 12) #converting matrix test datato time series data
