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
  city = sample(c('Riyadh', 'Jeddah', 'Makkah', 'Dammam', 'Khobar', 'Qasim'), 100, r = T),
  # registration.date = sample(seq(
  # as.Date('2017/05/15'), as.Date('2017/05/31'), by = "day"
  # ), 100, replace = T),
  quiz.1.score = sample(c(45:100, NA), 100, r = T),
  # quiz.1.date = 'Aug 10, 2017',
  quiz.2.score = sample(c(45:100, NA), 100, r = T),
  # quiz.2.date = 'Sep 20, 2017',
  quiz.3.score = sample(c(45:100, NA), 100, r = T),
  # quiz.3.date  = 'Nov 3, 2017',
  quiz.4.score = sample(c(45:100, NA), 100, r = T)
  # quiz.4.date = 'Dec 10, 2017'
)


# Save the data frame
save(students, file = 'data/students.rda', precheck = T)
