fit<-auto.arima(deseasonaled_data, seasonal=FALSE) #using auto arima function arima model is created
tsdisplay(residuals(fit), lag.max=45, main='(1,1,1) Model Residuals') #plotting residuals
fit2<-arima(deseasonaled_data, order=c(1,2,8)) #using more precise model
tsdisplay(residuals(fit2), lag.max=45, main='(44,1,1) Model Residuals')

fcast <- forecast(fit2, h=16)# forecasting de seasonalized data
#plotting forecasted data
plot(fcast, xlab='Years', ylab = 'Msft_Close', type="l", lwd=2, col="red",xlim=c(2000,2020),ylim=c(0,200),axes=F)
axis(1,at=2000:2020,labels=2000:2020);axis(2);box()



fit_w_seasonality1 = arima(close_clean_data,c(1,2,8),seasonal=c(1,2,2)) #using arima function arima model is created
seas_fcast1 <- forecast(fit_w_seasonality1, h=16) # forecasting seasonalized data
#plotting forecasted data
plot(seas_fcast1, xlab='Years', ylab = 'Msft_Close', type="l", lwd=2, col="red",xlim=c(2000,2029),ylim=c(0,200),axes=F)
axis(1,at=2000:2020,labels=2000:2020);axis(2);box()

      
      
      