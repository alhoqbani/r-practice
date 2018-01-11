# Creating Data Frames ----

named.vector <- c(1:10)
names(named.vector) <- letters[1:10]
letters.vec <- LETTERS[1:10]


data.frame(1:10, named.vector, row.names = 1:10)

L3 <- LETTERS[1:3]
fac <- sample(L3, 10, replace = TRUE)

(d <- data.frame(x = 1, y = 1:10, fac = fac))

data()

# Dimenames ----

df.mtcars <- mtcars

means <- colMeans(df.mtcars)
df.mtcars.mean <- rbind(df.mtcars, total = round(means))
rownames(df.mtcars.mean)[nrow(df.mtcars.mean)] <- 'total means'

kiol.per.gallon <- df.mtcars$mpg / 1.6
cbind(df.mtcars, kpg = kiol.per.gallon)
cbind(df.mtcars.mean, c(kiol.per.gallon, NA))


# Indexing & Subsetting ----

df.mtcars[1]
df.mtcars[1,grep('[at]', colnames(df.mtcars))]

c(1, 4, 5)
colnames(df.mtcars)
df.mtcars[grep('[a-z]', colnames(df.mtcars))]
df.mtcars[c('cyl', 6)]
df.mtcars[1:3]

grep('t', colnames(df.mtcars))


# Students: 5 vectors of students
student.1 <- c('Mike', 'Male', 35, T)
student.2 <- c('Sara', 'Female', 32, T)
student.3 <- c('John', 'Male', 25, F)
student.4 <- c('Nancy', 'Female', 40, T)
student.5 <- c('Cali', 'Female', 29, F)
# combine all students vectors into one vector
v.students <-
  c(student.1, student.2, student.3, student.4, student.5)
# Create the students matrix
mat.students <-
  matrix(
    v.students,
    nrow = 5,
    ncol = 4,
    byrow = T,
    dimnames = list(1:5, c('name', 'gender', 'age', 'present'))
  )

df.students <- as.data.frame(mat.students, stringsAsFactors = F)

sub.df <- df.students[1]

df.students[[c(1, 3)]]

df.students[1] # df with first col.
df.students[[1]] # vector with 1st col values. This is double subsetting. but we use only one of them.

df.students[4]
df.students[[c(4, 3)]] # I think this is the best way to yse double brackets. 
df.students[[4, 3]]

df.students[4,3]

df.students




my.list = list(
  c(1, 2, 3),
  list(
    c('hamoud', 'abdu', 'zezo'),
    c(33,44,55)
    ),
  list(
    mtcars, 
    df.students
  )
)


my.list[[c(3,1,6,28)]]


my.list[[c(3, 3, 4)]]


df.students[3]

my.list[[c(3,1,5,5)]]




my.list[[c(3,1,4)]]

my.list[[c(1, 3)]]

my.list[[]]

my.list[1]
df.students[1]
my.list[[1]]
df.students[[1]]

sub.d <- df.students[1]