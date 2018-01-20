rev <- read.csv('data-raw/google-developers/revenue.csv', header = F)
rev
head(rev, 3)

# This data has an unorthodox structure
# Each column represents a business and the rows represent the revenue for each day through March.
dim(rev) # 31 10
# 31 days of March and 10 business entities

# The total of revenu for each business
apply(rev, MARGIN = 2, sum) # Margin is the dimension (2 = columns)
# The total of revenu for each day
apply(rev, MARGIN = 1, sum, na.rm = T) # Margin is the dimension (1 = rows)


mk <- read.delim('data-raw/google-developers/mariokart.txt')
# ebay auction for mario video game
mk
summary(mk)

tapply(mk$totalPr, mk$cond, mean)
tapply(mk$totalPr, mk$wheel, mean)

tapply(mk$totalPr, mk[ ,c('cond', 'wheels')], mean)
tapply(mk$totalPr, mk[ ,c('cond', 'wheels')], length)

x <- by(mk$totalPr, mk[ ,c('cond', 'wheels')], mean)
x
str(x)
class(x)
x[1]
