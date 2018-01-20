stocks <- read.delim('data-raw/google-developers/stocks.txt')

# Remove incomplete cases (obs with NAs)
stocks <- na.omit(stocks)


# Create a summury for each ticker 

# find the all tickers
tickers <- unique(stocks$ticker)
# define an empty list to hold the result
tickker.summary <- list()
for (ticker in tickers) {
  # Get the logical filter for current ticker stocks
  these <- stocks$ticker == ticker
  # Append the summury of current ticker to the list
  # The element name will be the ticker name
  tickker.summary[[ticker]] <- summary(stocks[these ,])
}
tickker.summary$GOOG
