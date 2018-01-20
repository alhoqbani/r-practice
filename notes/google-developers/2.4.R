stocks <- read.delim('data-raw/google-developers/stocks.txt')

x <- c()
for (i in 1:10) {
  x <- append(x, i ^ 2)
}
x

# Find the highest and lowest price for each ticker

# Get the tickers from the data
the.tickers <- unique(stocks$ticker)
# Initialize empty vectors
lows <- c()
highs <- c()
# Loop all the tickers
for(ticker in the.tickers) {
  # Get the rows indexes for the current ticker
  look.at <- stocks$ticker == ticker # Boolean vector
  lows <- append(lows, min(stocks$low[look.at], na.rm = T))
  highs <- append(highs, max(stocks$high[look.at], na.rm = T))
}
names(lows) <- the.tickers
names(highs) <- the.tickers


