vec.1 <- 1:30

mat.1 <- matrix(1:30)

list.1 <- list(1:30)

attributes(vec.1)
attributes(mat.1)
attributes(list.1)
attributes(airquality)

names(vec.1)
names(vec.1) <- c(sample(letters, 30, replace = T))

names(vec.1) <- c(letters, letters[1:4])
names(vec.1) <- c(letters[1:30])

vec.2 <- c(name1 = 1, name2 = 2)
attributes(vec.2)

names(list.1) <- c("First Element")


colnames(mat.1) <- 'One col'
rownames(mat.1) <- c(sample(letters, 30, replace = T))

my.df <- airquality
names(my.df) <- letters[1:6]
colnames(my.df) <- LETTERS[1:6]


attributes(my.df)

row.names(my.df)


list.to.df <- list(
  'First Col' =  letters[1:5],
  'Second Col' = 1:10,
  'Third Col' = LETTERS[1:5]
)


list.to.df
str(list.to.df)




df.from.list <- as.data.frame(list.to.df)

str(df.from.list)


df.from.list$First.Col


str(mtcars)


list.mtcars <- as.list(mtcars)
str(list.mtcars)


str(list.mtcars[2, ])
mtcars[2 ,]
