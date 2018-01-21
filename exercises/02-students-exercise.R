# Student Exercise

# Load the data
load('data/students.rda')


# Task 01: Explore The Data ------------------------------------------------

# What is the type of the students object?
typeof(students)

# What is the class?
class(students)

# What is the students object attributes?
attributes(students)

# How many variables?
ncol(students)

# Length?
length(students)

# What are the names of the variables?
names(students)
colnames(students)

# How many observations?
nrow(students)

# dim and dimnames?
dim(students)
dimnames(students)

# What is the structure?
str(students)

# Summary?
summary(students)

# Head and Tail?
head(students)
tail(students)

# How many variables are factors?
sum(mapply(is.factor, students))



# Task 02: Cleaning The Data ----------------------------------------------

# Some students did not take all four quizes. Missing quizes are 'NA'
# Should we replace missing quizes scores with 0 or the mean of the other quizes?

# * * missing values ------------------------------------------------------

quizes.cols <- paste0('quiz.', 1:4, '.score')

# Option 1: just change it to 0
load('data/students.rda')
students[quizes.cols][is.na(students[quizes.cols])] <- 0

# Option 2: replace with the mean of the student's other quizes
load('data/students.rda')


# Options 3: Remove all students with missing values
load('data/students.rda')
# students <- na.omit(students)
# # Notice the attr: na.action
# attributes(na.omit(students))

# Cleanup
rm(quizes.cols)

# Task 02: Editing Variables -----------------------------------------------


# * * add quiz.mean -------------------------------------------------------

# Add 'quiz.mean' variable representing the mean of quizes for each student
# rounding to 2 digits
students$quiz.mean <-
  round(rowMeans(students[paste0('quiz.', 1:4, '.score')], na.rm = T), digits = 2)


# * * add grade -----------------------------------------------------------

# Add 'grade' variable which represents the grade of the student based on
# the `quiz.mean` Grades are one of c('A', 'B', 'C', 'F').
# The grading system is as follow:
# F <- x < 60
# C <- x >= 60 < 70
# B <- x >= 70 < 85
# A <- x >= 85

grades.factor <-
  cut(x = students$quiz.mean, breaks = c(0, 60, 70, 85, 100))
levels(grades.factor) <- c('F', 'C', 'B', 'A')
students$grade <- grades.factor

# Cleanup
rm(grades.factor)


# * * add age.category ----------------------------------------------------

# Add a new variable 'age.category' represents two categories of age:

# 1) Youth: less than 18
# 2) Adult: 18 or more

students$age.category <-
  cut(students$age,
      breaks = c(0, 18, 60),
      labels = c('Youth', 'Adult'))


# * * add region ----------------------------------------------------------

# Add variable 'regions', which represents three regions based on the city.
# The regions as follow:
# 1) West <- c('Jeddah', 'Makkah')
# 2) Center <- c('Riyadh', 'Qasim')
# 3) East <- c('Dammam', 'Khobar')

students$region <- students$city
levels(students$region) <-
  c('East', 'West', 'East', 'West', 'Center', 'Center')


# * * add first.name and last.name ----------------------------------------

# We want to be able to sort the names by last name. We need to split the names
# Add two variables: 'first.name', 'last.name' by splitting the values from 'name'

split.names.list <-
  strsplit(as.character(students$name), split = ', ')
split.names.vector <- unlist(split.names.list)
split.names.matrix <-
  matrix(split.names.vector, ncol = 2, byrow = T)
colnames(split.names.matrix) <- c('first.name', 'last.name')
students <- cbind(split.names.matrix, students)

# Cleanup
rm(split.names.list, split.names.matrix, split.names.vector)

# * * add city.region -----------------------------------------------------

# Let's merge two variables: 'region' and 'city' into one variable: 'city.region'
# The values should be seperated by ', ' example: 'Jeddah, West'

students$city.regions <-
  paste0(students$city, ', ', students$region)


# * * Reorder Variables ---------------------------------------------------

# Reorder the student data frame so:
# region and city.regions comes after city
# and age.category after age

names(students)

col.indices <-
  c(1:5,
    which(names(students) == "age.category"),
    6,
    which(names(students) %in% c('region', 'city.regions')),
    7:(ncol(students) - 3))


names(students)[col.indices]
students <- students[, col.indices]

# Cleanup
rm(col.indices)

# * * Remove Variables ----------------------------------------------------

# The students data frame is big and has extra variables
# Let's remove the following variables:
# 'name', 'age.category', 'city', 'region'
names(students)
# students[, -c('name', 'age.category', 'city', 'region')] # Why this doesn't work?
students <-
  students[, !names(students) %in% c('name', 'age.category', 'city', 'region')]



# Reshaping Data Frames ---------------------------------------------------


# * * wide to long --------------------------------------------------------

# This data is long. We need to convert it to wide data.
# The data represents observations of students quizes.
# Inseted of having four diffirent variables for the quizes (quize.x.score)
# We want to have only two variables: 'quiz' and 'score'
# The variable quiz will represent the quiz number: 1, 2, 3, 4
# And the variable score represents the score for each quiz

# Source: https://www.r-bloggers.com/converting-a-dataset-from-wide-to-long/
? reshape

# First we need to rename the quiz varaibles to something reshape() can understand.
# The new names should have a pattern var.n (quiz.1, quiz.2, quiz.3, quiz.4)
quizes.cols <- paste0('quiz.', 1:4, '.score')
# Option 1
names(students)[names(students) %in% quizes.cols] <-
  paste0('quiz.', 1:4)
# Option 2
names(students) <- sub('.score', '', names(students))


# Now, we can use reshape() to convert from wide to long

students.long <- reshape(
  students,
  varying = paste0('quiz.', 1:4),
  direction = 'long',
  idvar = c('first.name', 'last.name'),
  sep = '.',
  times = 'score',
  drop = c('quiz.mean', 'grade')
)


# Cleanup 
rm(quizes.cols)

lapply(split(students.long, f = students.long$time), summary)
