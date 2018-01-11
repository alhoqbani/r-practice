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

# Control Structure ----

# Logical Operators ----
"
>
<
<=
>=
&&
||
==
!=
"
x <- c(1:10)
x > 5
x == 5
x != 5
mtcars[mtcars$cyl != 4 ,]
mtcars[mtcars$cyl == c(4, 6) ,]
mtcars[mtcars$cyl > c(4, 6) ,]
mtcars[mtcars$cyl != 4 ,]
mtcars[mtcars$cyl != 4 & mtcars$cyl != 6 ,]
mtcars[mtcars$cyl != 4 && mtcars$cyl != 8 ,]


x <- c(2.1, 4.2, 3.3, 5.4, 9.5)

y <- 1:10

y[y > 5 & y < c(9, 8)]
y[y > 1 && y == 1]
y[y > 1 && FALSE]
?'&&'

x[c]
x[order(x)]

x[c(1, 1, 1, 3, 4, 4)]
x[c(1, 1, 1, 3.3, 4, 4)]

x[-c(1,4)]
x[c(-1, 2)]

x[c(T, F)]

# if, else ----
if (condition) {
  # do something
} else {
  # do something else
}

if (T) {
  print('Always True')
}


# shrorthand 
if (13 > 2 ) print('1 greater')

if (condition) {
  
}

x = (condintion) ? 'True vavlue' : 'false value';


# shorthand (Vectorization with ifelse)
ifelse(1 <= 10, "x less than 10", "x greater than 10")
ifelse(1 <= 10, print('true'), "x greater than 10")

raining <- sample(c(T, F), 1)
hiking <- ifelse(raining, 'No hiking', 'Yes to hiking')
hiking

## Set the value of a symbol based on a condition
if (sample(x, 1) < 10) {
  y <- 5
} else {
  y <- 0
}
# shorthand
x <- c(1:20)
compare.this <- sample(x, 1)
compare.this
y <- if (compare.this < 10) {
  print('in 1st block (if)')
  5
  plot(c(1:10))
  1 + 10
  my.mean <- colMeans(mtcars)
} else {
  print('in 2nd block (else)')
  0
}
y
# for ----

for (i in 1:10) {
  print(i)
}
#shorthand 
for (i in 1:4) print(x[i])










for(row.num in seq(nrow(mat.students))) {
  # print(row.num)
  # print(mat.students[1, ])
  current.col <- mat.students[row.num, ]
  print(current.col)
  for(value in current.col) {
    print(value)
  }
}


for(row.num in seq(nrow(mat.students))) {
  for (col.num in seq(ncol(mat.students))) {
    print(mat.students[row.num, col.num])
  }
}


# nested loop
m <- matrix(1:10, 2)
for (i in seq(nrow(m))) {
  for (j in seq(ncol(m))) {
    print(m[i, j])
  }
}


car.gear <- matrix(ncol = 2)
df.car <- data.frame()
for (row.num in seq(nrow(mtcars))) {
  row.name <- rownames(mtcars)[row.num]
  gear.value <- mtcars[row.num, 'gear']
  car.gear <- rbind(car.gear, c(row.name, gear.value))
  df.car <- rbind(df.car, c(row.name, gear.value))
}
df.car
car.gear

mat.students
rbind(mat.students, student.1)

df.car <- data.frame()
for (row.num in seq(nrow(mtcars))) {
  row.name <- rownames(mtcars)[row.num]
  gear.value <- mtcars[row.num, 'gear']
  temp.df  <- data.frame(row.name, gear.value)
  car.gear <- rbind(car.gear, c(row.name, gear.value))
  df.car <- rbind(df.car, temp.df)
}
df.car


# while ----
i <- 1
while (i < 10) {
  print(i)
  i <- i + 1
}

# repeat ----
repeat {
  # simulations; generate some value have an expectation if within some range,
  # then exit the loop
  if ((value - expectation) <= threshold) {
    break
  }
}

# break ----
x = 1:10 
for (i in x){ 
  if (i == 2){ 
    break 
  }
  print(i)
}

names.friends <- c('hmaoud', 'yazeed', 'abdul')


for(name in names.friends) {
  
  for (i in 1:3) {
    if (name == 'yazeed') {
      break
    }
    print(name)
  }
  break
  print('after next')
}


for(i in seq(10)) {
  
  car <- mtcars[i,]
  httr
  # Print only odd numbers
  if(u){
    next
  }
  
  
  
  
  
  print('print me only when i is even')
  
}




# next ----
for (i in 1:20) {
  if (i%%2 == 1) {
    next
  } else {
    print(i)
  }
}

# return ----
?return
