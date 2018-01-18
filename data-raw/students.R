# Create a data frame of students

# Need randomNames to generate random names
if (!suppressWarnings(require('randomNames'))) {
  install.packages('randomNames')
  library('randomNames')
}

# Set the seed to generate the same values
set.seed(111)

# Generate random names
random.names <- randomNames(
  n = 100,
  ethnicity = c(6),
  which.names = 'both',
  sample.with.replacement = F,
  return.complete.data = T
)


# Create the data frame
students <- data.frame(
  name = paste0(random.names$first_name, ', ', random.names$last_name),
  gender = ifelse(random.names$gender, 'Female', 'Male'),
  age = sample(15:45, 100, r = T),
  city = sample(c('Riyadh', 'Jeddah', 'Makkah', 'Dammam'), 100, r = T),
  quiz.1 = sample(45:100, 10, r = T),
  quiz.2 = sample(45:100, 10, r = T),
  quiz.3 = sample(45:100, 10, r = T),
  quiz.4 = sample(45:100, 10, r = T)
)


# Save the data frame
save(students, file = 'data/students.rda')
