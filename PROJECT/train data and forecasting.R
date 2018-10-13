#clean train data
close_clean_data_train<-tsclean(msft_close_train)
close_clean_log_train=log(msft_close_train)
#plotting cleaned train data 
plot(close_clean_data_train, xlab='Years', ylab = 'Msft_Close', type="l", lwd=2, col="red",xlim=c(2000,2019),axes=F)
axis(1,at=2000:2020,labels=2000:2020);axis(2);box()



# decomposing train data
decomposed_data_train = stl(close_clean_data_train, s.window="periodic")
plot(decomposed_data_train)
#plotting decomposed train data
deseasonaled_data_train<-seasadj(decomposed_data_train)

#validating de seasonalized train model using test data
fit_w_train = auto.arima(deseasonaled_data_train, seasonal=FALSE)
seas_fcast_deseasonaled_train <- forecast(fit_w_train, h=45)
#
plot(seas_fcast_deseasonaled_train, xlab='Years', ylab = 'Msft_Close', type="l", lwd=2, col="red",xlim=c(2000,2020),ylim=c(0,200),axes=F)
axis(1,at=2000:2020,labels=2000:2020);axis(2);box()
lines(msft_close_test,col="black")

#validating seasonalized train model using test data
fit_w_seasonality_train = arima(close_clean_data_train,c(1,2,7), seasonal=c(1,2,2))
seas_fcast_train <- forecast(fit_w_seasonality_train, h=45)
plot(seas_fcast_train, xlab='Years', ylab = 'Msft_Close', type="l", lwd=2, col="red",xlim=c(2000,2020),ylim=c(0,200),axes=F)
axis(1,at=2000:2020,labels=2000:2020);axis(2);box()
lines(msft_close_test)  