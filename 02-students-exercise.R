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
mapply(is.factor, students)



# Task 04: Cleaning The Data ----------------------------------------------

# Some students did not take all four quizes. Missing quizes are 'NA'
# Should we replace missing quizes scores with 0 or the mean of the other quizes?
load('data/students.rda')
# Option 1: just change it to 0
students[quizes.cols][is.na(students[quizes.cols])] <- 0

# Option 2: replace with the mean of the student's other quizes


# Options 3: Remove all students with missing values




# Task 02: Adding Variables -----------------------------------------------


# Add 'quiz.mean' variable representing the mean of quizes for each student
# rounding to 2 digits
students$quiz.mean <-
  round(rowMeans(students[paste0('quiz.', 1:4, '.score')], na.rm = T), digits = 2)


# Add 'grade' variable which represents the grade of the student based on 
# the `quiz.mean` Grades are one of c('A', 'B', 'C', 'F'). 
# The grading system is as follow:
# F <- x < 60
# C <- x >= 60 < 70
# B <- x >= 70 < 85
# A <- x >= 85

grades.factor <- cut(x = students$quiz.mean, breaks = c(60, 70, 85, 100))
summary(grades.factor)
