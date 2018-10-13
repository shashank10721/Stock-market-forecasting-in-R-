#cleandatatest
close_clean_data_test<-tsclean(msft_close_test)
plot(close_clean_data_test, xlab='Years', ylab = 'Msft_Close', type="l", lwd=2, col="red",xlim=c(2000,2019),axes=F)
axis(1,at=2000:2020,labels=2000:2020);axis(2);box()
