# Introduction ------------------------------------------------------------
"A factor is a vector object used to specify a discrete classification (grouping) of the components of other vectors of the same length."

"continuous variables vs categorical variables"
"regular vectors are called continuous variables, while factors are categorical"


# Creating Factors --------------------------------------------------------

# Read factor() documentations
?factor

# Create empty factor with 0 levels
fac.empty <- factor()
str(fac.empty)

# Create factor from a vector of length 10
fac.1 <- factor(1:10)
str(fac.1)

fac.2 <- factor(rep(1:5, 3))
str(fac.2)
levels(fac.2) # 5 levels only
nlevels(fac.2)
length(fac.2) # length is 15 b/c we have 15 values
summary(fac.2)
n



blood.types <- c('A', 'O', 'A', 'AB', 'B', 'O', 'AB', 'AB')
as.factor(blood.types)
blood.factor <- factor(blood.types)
str(blood.factor) # Check the encoding of the characters



# Create a factor with levels
set.seed(123)
vec.cahr <- sample(letters[1:4])
fac.3 <- factor(vec.cahr, levels = letters[1:5])
str(fac.3)
summary(fac.3)
fac.4 <- factor(sample(letters[1:10], 10, replace = T), levels = letters[1:5])
str(fac.4)
fac.4 <- factor(sample(letters[1:10], 10, replace = T), levels = letters[1:5])
str(fac.4)

blood.factor <- factor(blood.types, levels = c('A', 'B', 'AB'))
str(blood.factor)

blood.factor <- factor(blood.types, levels = c('A', 'B', 'AB', 'O'))
str(blood.factor)

levels(blood.factor) <- c('BT_A', 'BT_B', 'BT_AB', 'BT_O')


blood.factor <-
  factor(
    blood.types,
    labels = c('BT_A', 'BT_B', 'BT_AB', 'BT_O')
  )
cars <- c('Audi', 'BMW', 'Toyota', 'Mercedes', 'Z', 'Camry', 'Volvo', 'Honda')

cyls <- c(6, 8 ,4 , 12, 6, 12, 12, 6)
names(cyls)

cyls.fac <- factor(
  cyls,
  labels = c('Small', 'Sport', 'Sedan', 'Big')

)
str(cyls.fac)
summary(cyls.fac)
str(blood.factor)
levels(blood.factor)
summary(blood.factor)


tweets.username <- c(
  'Hamoud', 'Hamoud', 'Hamoud',
  'Yazeed', 'Yazeed',
  'Ashoor', 'Ashoor', 'Ashoor', 'Ashoor',
  'Hadley', 'Hadley', 
  'Mike', 'Mike', 'Mike', 'Mike'
)

tweets.fac <- factor(
  tweets.username,
  levels = c('Hamoud', 'Yazeed', 'Ashoor', 'Hadley', 'Mike'),
  labels = c('Student1','Student2','Student3', 'Teacher1', 'Teacher2'),
  
)




str(tweets.fac)
summary(tweets.fac)
levels(tweets.fac) <- c(rep('Stuednt', 3), rep('Teacher', 2))


# Ordinal Factors

tshirts <- c('S', 'XL', 'M', 'L','S', 'L',
             'XL','XL', 'M','S', 'L', 'S',
             'S', 'XL')

tshirts.fac <- factor(tshirts)
str(tshirts.fac)

# We explicitly define the levels to enforce the order of printing
tshirts.fac <- factor(tshirts, levels = c('S', 'M', 'L', 'XL'))
str(tshirts.fac)

table(tshirts.fac)
barplot(table(tshirts.fac))

# Is small tshirt less than x large tshirt?
tshirts.fac[1] < tshirts.fac[2] # Error: ‘<’ not meaningful for factors
# We need to make the factor ordinal factor
is.ordered(c('S', 'M', 'L', 'XL')) # FALSE
tshirts.fac <- factor(tshirts, levels = c('S', 'M', 'L', 'XL'), ordered = T)
str(tshirts.fac)
tshirts.fac[2] < tshirts.fac[3] # TRUE


# Months Example:
mons = c("March","April","January","November","January",
         "September","October","September","November","August",
         "January","November","November","February","May","August",
         "July","December","August","August","September","November",
         "February","April")
mons.fac = factor(mons)
str(mons.fac)
table(mons.fac)

# We want them in order and complete include 12 months:

nlevels(mons.fac) # This should be 12
mons.fac[2] < mons.fac[2] # This should be true.


# Convert back to numbers
f <- factor(c(3.4, 1.2, 5))
as.numeric(f)
as.numeric(levels(f)[f])  # you MUST use this to convert factor to numeric vector

# Example:

fert = c(10, 20, 20, 50, 10, 20, 10, 50, 20)
fert.fac = factor(fert, levels = c(10, 20, 50), ordered = TRUE)

mean(fert.fac)
mean(as.numeric(levels(fert.fac)[fert.fac]))

# Further reading: https://www.stat.berkeley.edu/classes/s133/factors.html


# r-novice-inflammation Example -------------------------------------------
source.link <- 'https://swcarpentry.github.io/r-novice-inflammation/12-supp-factors/'

dat <- read.csv('data-raw/r-novice-inflammation/sample.csv', stringsAsFactors = T)
str(dat$Gender)
summary(dat$Gender)

# b/c column group is a factor we can easly create a plot showing numbers in each group
table(dat$Group)
barplot(table(dat$Group))

# But we have problem with the gender column, it has extra levels (misspelled)
barplot(table(dat$Gender))

plot(x = dat$Gender, y = dat$BloodPressure)

dat$Gender[dat$Gender == 'M'] <- 'm'
dat$Gender <- droplevels(dat$Gender)
summary(dat$Gender)



levels(dat$Gender)[2] <- 'f'
plot(x = dat$Gender, y = dat$BloodPressure)

# R Manual Example (Australian Accountants) -------------------------------

# 30 accountants, each one is represented by his state's mnemonics (short name)
# Australia has 8 states: "act nsw nt qld sa tas vic wa"
state <- c("tas", "sa",  "qld", "nsw", "nsw", "nt",  "wa",  "wa",
           "qld", "vic", "nsw", "vic", "qld", "qld", "sa",  "tas",
           "sa",  "nt",  "wa",  "vic", "qld", "nsw", "nsw", "wa",
           "sa",  "act", "nsw", "vic", "vic", "act")


statef <- factor(state)
statef
levels(statef)

# Income for each accountants (60 = income for 'tas')
incomes <- c(60, 49, 40, 61, 64, 60, 59, 54, 62, 69, 70, 42, 56,
             61, 61, 61, 58, 51, 48, 65, 49, 49, 41, 48, 52, 46,
             59, 46, 58, 43)


# We want the mean for all accountants from each state (group by state)
incmeans <- tapply(incomes, statef, mean)

# We want the standard errors of the state income means
stdError <- function(x) {
  sqrt(var(x) / length(x))
  # print(x) # what is passed to this function?
}
incster <- tapply(incomes, statef, stdError) # standard errors for each state

# Let's Add more to the example:
# Introduce the gender classification
genders <- sample(c('F', 'M'), 30, replace = T)
gendersf <- factor(genders)
summary(gendersf)

# Calculate the average mean based on gender
tapply(incomes, gendersf, mean)

# More complicated: Calculate mean based on gender and state



# Resources ---------------------------------------------------------------

links <- c(
  "https://www.stat.berkeley.edu/classes/s133/factors.html"
)
