load('data/final.students.rda')

student.grade <- function(id) {
  student <- students[students$student.id == id, ]
  as.character(student$grade)
}

student.grade(17670)

# Create a function that retrun the list of quizes grades

student.quizes <- function(id) {
  quiz.df <- students[students$student.id == id, paste0('quiz.', 1:4)]
  as.list(quiz.df)
}

student.quizes(17670)

student.bio <- function(id) {
  student <- students[students$student.id == id,]
  
  c(
    name = paste(student$first.name, student$last.name),
    age = student$age,
    gender = as.character(student$gender),
    address = student$city.regions
  )
}

student.bio(17893)

grade.by.name <- function(name) {
  grade <- students[students$last.name == name,]
  as.character(grade$grade)
}

grade.by.name('el-Zaki')

quizes.by.name <- function(name) {
  student <- students[students$last.name == name,]
  as.list(student[c(paste0('quiz.', 1:4))])
}

quizes.by.name('el-Semaan')

bio.by.name <- function(name) {
  student <- students[students$last.name == name,]
  
  c(
    name = paste(student$first.name, student$last.name),
    age = student$age,
    gender = student$gender,
    address = student$city.regions
  )
}

bio.by.name('al-Jaber')
