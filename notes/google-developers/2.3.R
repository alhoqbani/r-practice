stocks <- read.delim('data-raw/google-developers/stocks.txt')

# Remove incomplete cases (obs with NAs)
stocks <- na.omit(stocks)

# Add a new column describing the difference between closing and openning price

# Noraml if statements can do only one element comparison
status <- if (stocks$close[1] > stocks$open[1]) {
  'up'
} else if (stocks$close[1] < stocks$open[1]) {
  'down'
} else {
  'flat'
}


stocks$change <- ifelse(stocks$close > stocks$open, 'up', 'down')
stocks$change <-
  ifelse(stocks$close == stocks$open, 'flat', stocks$change)

stocks[stocks$close < stocks$open, 'change']
stocks[stocks$close > stocks$open, 'change']
stocks[stocks$close == stocks$open, 'change']


x <- sample(-1:13, 10)
y <- sample(-1:13, 10)

x > 0
x > y

all(x > 0)
any(x > 0)

all(x > y)
any(x > y)


x > 0
y > 0
x > 0 & y > 0 # Compare between two lines above
x > 0 | y > 0 # Compare between two lines above


which(x > 0) # return index of elements greater than 0
x[which(x > 0)] # return elements greater than 0


# Find the stocks where fluctuation is more than 25%
fluctuation <- (stocks$high - stocks$low) / stocks$close
head(fluctuation)
big.change <- fluctuation > 0.25
sum(big.change) # 45 stocks have fluctuation more than 25%
which(big.change) # index of stocks with fluctuation greater than 25
stocks[which(big.change) ,]$ticker
