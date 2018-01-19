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
load('data/students.rda')

# - missing values ----------------------------------------------------------
quizes.cols <- paste0('quiz.', 1:4, '.score')
# Option 1: just change it to 0
students[quizes.cols][is.na(students[quizes.cols])] <- 0

# Option 2: replace with the mean of the student's other quizes


# Options 3: Remove all students with missing values




# Task 02: Adding Variables -----------------------------------------------




# - quiz.mean -------------------------------------------------------------

# Add 'quiz.mean' variable representing the mean of quizes for each student
# rounding to 2 digits
students$quiz.mean <-
  round(rowMeans(students[paste0('quiz.', 1:4, '.score')], na.rm = T), digits = 2)



# - grade -----------------------------------------------------------------

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


# - age.category ----------------------------------------------------------

# Add a new variable 'age.category' represents two categories of age:

# 1) Youth: less than 18
# 2) Adult: 18 or more

students$age.category <-
  cut(students$age,
      breaks = c(0, 18, 60),
      labels = c('Youth', 'Adult'))


# - region ----------------------------------------------------------------

# Add variable 'regions', which represents three regions based on the city.
# The regions as follow:
# 1) West <- c('Jeddah', 'Makkah')
# 2) Center <- c('Riyadh', 'Qasim')
# 3) East <- c('Dammam', 'Khobar')

students$region <- students$city
levels(students$region) <-
  c('East', 'West', 'East', 'West', 'Center', 'Center')

# Reorder the student data frame so region comes next to city and age.category next to age

col.indices <-
  c(1:3,
    which(names(students) == "age.category"),
    4,
    which(names(students) == "region"),
    5:ncol(students) - 2)

students <- students[, col.indices]
names(students)


# - first.name and last.name ----------------------------------------------
# We want to be able to sort the names by last name. We need to split the names
# Add two variables: 'first.name', 'last.name' by splitting the values from 'name'

split.names.list <- strsplit(as.character(students$name), split = ', ')
split.names.vector <- unlist(splitted.names)
split.names.matrix <- matrix(split.names.vector, ncol = 2, byrow = T)
colnames(split.names.matrix) <- c('first.name', 'last.name')
students <- cbind(split.names.matrix, students)
