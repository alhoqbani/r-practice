mk <- read.delim('data-raw/google-developers/mariokart.txt')


# with will loop the data frame and evaluate the expression
colsePr <- with(mk, totalPr - shipPr)


mk <- within(mk, {
  colsePr <- totalPr - shipPr
})


aggregate(. ~ wheels + cond, mk, mean)

aggregate(totalPr ~ wheels + cond, mk, mean)
# similar to:
tapply(mk$totalPr, list(mk$wheels, mk$cond), mean)
