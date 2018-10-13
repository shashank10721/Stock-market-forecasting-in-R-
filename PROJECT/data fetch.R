library(alphavantager)

# Set API Key (Do this once)
av_api_key("YGFW8H5RH7BBN813")

# Get Time Series Data
msft_data<-av_get(symbol = "MSFT", av_fun = "TIME_SERIES_DAILY", interval = "60min",outputsize="full")
