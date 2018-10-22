# States Info
statesInfo <- read.csv('data-raw/stateData.csv')
str(statesInfo)

?subset
subset(statesInfo, state.region == 1)
statesInfo[statesInfo$state.region == 1,]


subset(statesInfo, state.region == 1, select = c("income", "population"))
statesInfo[statesInfo$state.region == 1, c("income", "population")]


# Reddit Survey
reddit <- read.csv("data-raw/reddit.csv")
str(reddit)
# Factors
levels(reddit$employment.status)
table(reddit$employment.status)
summary(reddit)

# Plot Categorial ordinal variables (How to order factors?)
levels(reddit$age.range)
table(reddit$age.range)
plot(reddit$age.range) # BASE PLOT

# ggplot2
library(ggplot2)
qplot(reddit$age.range)
qplot(x = reddit$income.range)

# Fix the order of age.range by reassiging the levels.
# Option 1
levels(reddit$age.range) <- c("Under 18", levels(reddit$age.range[1:6]))
# Option 2
reddit$age.range <- factor(reddit$age.range, c("Under 18", "18-24", "25-34", "35-44", "45-54", "55-64", "65 or Above"))
?ordered
qplot(reddit$age.range)
