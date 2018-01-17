# Clean patients sample patients.data from r-novice

patients.data <- read.csv('data-raw/r-novice-inflammation/sample.csv')



# Clean the columns:
colnames(patients.data) <- tolower(make.names(colnames(patients.data), allow_ = F))

# Fix the gender column (has lowercase and uppercase letters)

levels(patients.data$gender) #  "f" "F" "m" "M"
levels(patients.data$gender)[c(1, 3)] <- c('F', 'M')
levels(patients.data$gender) # "F" "M"



save(patients.data, file = 'data/r-novice-inflammation/patients.data.rda')
