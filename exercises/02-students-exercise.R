# Student Exercise

# Load the data
load('data/students.rda')


# Task 01: Explore The Data ------------------------------------------------

# What is the type of the students object?


# What is the class?


# What is the students object attributes?


# How many variables?


# Length?


# What are the names of the variables?


# How many observations?


# dim and dimnames?


# What is the structure?


# Summary?


# Head and Tail?


# How many variables are factors?




# Task 02: Cleaning The Data ----------------------------------------------

# Some students did not take all four quizes. Missing quizes are 'NA'
# Should we replace missing quizes scores with 0 or the mean of the other quizes?

# * * missing values ------------------------------------------------------

quizes.cols <- paste0('quiz.', 1:4, '.score')

# Option 1: just change it to 0
load('data/students.rda')


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



# * * add grade -----------------------------------------------------------

# Add 'grade' variable which represents the grade of the student based on
# the `quiz.mean` Grades are one of c('A', 'B', 'C', 'F').
# The grading system is as follow:
# F <- x < 60
# C <- x >= 60 < 70
# B <- x >= 70 < 85
# A <- x >= 85



# Cleanup
rm(grades.factor)


# * * add age.category ----------------------------------------------------

# Add a new variable 'age.category' represents two categories of age:

# 1) Youth: less than 18
# 2) Adult: 18 or more




# * * add region ----------------------------------------------------------

# Add variable 'regions', which represents three regions based on the city.
# The regions as follow:
# 1) West <- c('Jeddah', 'Makkah')
# 2) Center <- c('Riyadh', 'Qasim')
# 3) East <- c('Dammam', 'Khobar')




# * * add first.name and last.name ----------------------------------------

# We want to be able to sort the names by last name. We need to split the names
# Add two variables: 'first.name', 'last.name' by splitting the values from 'name'





# * * add city.region -----------------------------------------------------

# Let's merge two variables: 'region' and 'city' into one variable: 'city.region'
# The values should be seperated by ', ' example: 'Jeddah, West'




# * * Reorder Variables ---------------------------------------------------

# Reorder the student data frame so:
# student.id comes first.
# region and city.regions comes after city
# and age.category after age



# Cleanup


# * * Remove Variables ----------------------------------------------------

# The students data frame is big and has extra variables
# Let's remove the following variables:
# 'name', 'age.category', 'city', 'region'



# Reshaping Data Frames ---------------------------------------------------


# * * wide to long --------------------------------------------------------

# This data is long. We need to convert it to wide data.
# The data represents observations of students quizes.
# Inseted of having four diffirent variables for the quizes (quize.x.score)
# We want to have only two variables: 'quiz' and 'score'
# The variable quiz will represent the quiz number: 1, 2, 3, 4
# And the variable score represents the score for each quiz

# Source: https://www.r-bloggers.com/converting-a-dataset-from-wide-to-long/
?reshape

# First we need to rename the quiz varaibles to something reshape() can understand.
# The new names should have a pattern var.n (quiz.1, quiz.2, quiz.3, quiz.4)


# Now, we can use reshape() to convert from wide to long



# Cleanup 



