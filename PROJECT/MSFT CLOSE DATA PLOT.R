stocks <- xts(msft_data[,-1], order.by=as.Date(msft_data$timestamp, "%m/%d/%Y")) #converting dataframe data to time series data
msft_monthly<-to.monthly(stocks$close, name="msft") #aggregating the data monthly
time_series_msft = ts(msft_monthly,start = c(2000,1),frequency = 12) # converting aggregated data to time series 
msft_close<-time_series_msft[,4] #selecting only close values

#ploting close data
plot(msft_close, xlab='Years', ylab = 'Msft_Close',main="MICROSOFT STOCK CLOSE PRICE IN LAST 20 YEARS", type="l", lwd=2, col="red",xlim=c(2000,2019),axes=F)
axis(1,at=2000:2020,labels=2000:2020);axis(2);box()
