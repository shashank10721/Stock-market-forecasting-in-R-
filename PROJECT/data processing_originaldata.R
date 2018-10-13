#cleandata
close_clean_data<-tsclean(msft_close)
close_log_data=log(close_clean_data)

#plotting clean data
plot(close_clean_data, xlab='Years', ylab = 'Msft_Close',main="CLEANED MSFT_CLOSE DATA", type="l", lwd=2, col="red",ylim=c(0,200),xlim=c(2000,2018),axes=F)
axis(1,at=2000:2020,labels=2000:2020);axis(2);box()


#AUGMENTED DICKER FULLER TEST
ns <- ndiffs(close_log_data)
adf.test(close_log_data, alternative="stationary")
stationary_data <- diff(close_log_data,differences=ns)
suppressWarnings(adf.test(stationary_data, alternative="stationary"))

plot(stationary_data, xlab='Years', ylab = 'Msft_Close', type="l", lwd=2, col="red",xlim=c(2000,2019),axes=F)
axis(1,at=2000:2020,labels=2000:2020);axis(2);box()


#DECMPOSING
decomposed_data = stl(close_clean_data, s.window="periodic")
plot(decomposed_data)
deseasonaled_data<-seasadj(decomposed_data)
plot(deseasonaled_data, xlab='Years', ylab = 'Msft_Close', main="deseasonaled Msft_close data",type="l", lwd=2, col="red",xlim=c(2000,2019),axes=F)
axis(1,at=2000:2020,labels=2000:2020);axis(2);box()



#DETERMINIG ORDER OF ARIMA
Acf(stationary_data, main='')
Pacf(stationary_data, main='')
