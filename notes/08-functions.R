# Introduction ------------------------------------------------------------

"
Functions are a fundamental building block of R.
They are objects can be treated as any objects in R.
"

"
My own definitions:
a function is a reusable collection of codes/expressions/statements.
packages are collections of resuble functions.
"


# Basic structure ---------------------------------------------------------

func.name <- function(arglist)  {
  # body (expr)
}

# from help('function')
function(arglist) {
  expr
  return(value)
}



# Define a function
add.three <- function(arg.1) {

  if (arg.1 %% 2 == 0) {
    return('Please provide odd number')
  } else {
    arg.1 <- arg.1 + 10
  }
  
  arg.1 * 1000
}


add.three(3)

# Call the function
add.three(10) # same as 4 + 3
add.three(9:10)  # same as 1:10 + 3

# Inspect the function
add.three # Print the function
print(add.three)

class(add.three)
str(add.three)
str(mtcars)
attributes(add.three)
attributes(mtcars)

formals(add.three) # list of arguments the function "accept"
formals(matrix)
body(add.three) # the body of the function (block code between curly braces)
body(matrix)
environment(add.three)
environment(mean)
library(dplyr)
environment(select)
args(add.three) # use only interactively
args(matrix)

# Task one: functions to convert between c to f temprutres
"
formulas: 30°C x 1.8 + 32 = 86°F; (50°F - 32) x .5556 = 10°C
"
c.to.f <- function (c.temp) {
  c.temp * 1.8 + 32
}
c.to.f(30)
c.to.f(-40)

f.to.c <- function (f.temp) {
  (f.temp - 32) * 0.5556
}
f.to.c(50)


# Task two: function to add 2nd arg before and after 1st arg
"
Input = two vectors, output one vector: first and last element is vector 2
"
wrapper <- function (vec.1, vec.2) {
  c(vec.1, vec.1, vec.2)
}

wrapper(c(1:10), c('---'))



# Task three: return first and last of vector
outsiders <- function (x) {
  c(x[1], x[length(x)])
}
outsiders(month.name)


# Task four: return random month name
rand.month <- function () {
  index <- sample(seq(month.name), 1)
  month.name[index]
}
rand.month()
formals(rand.month)


# Function Components -----------------------------------------------------

formals()
body()
environment()

# Arguments ----
"formal arguments vs actual arguments"
"mapping actual arguments to formal arguments"
"specify arguments by position, by complete name, or by partial name"
"Arguments are matched first by exact name (perfect matching), then by prefix matching, and finally by position.(positional matching)"

# Formal arguments
"
What arguments the function accept.
The arglist part.
Three options: empty arglist, one or more arguments, or `...`
"
formals(matrix)
formals(c.to.f)
?'function'

## Required Arguments
## number & multiplier are (two) formal arguments accepted by the arguments.
multiply.by <- function (number, multiplier) {
  
  return(number * 10)
  force(multiplier)
}

multiply.by <- function (number, multiplier) {
  
  force(multiplier)
  if (number < 100) {
    return(number + 10)
  }
  
  number * multiplier
}

multiply.by(300, 2)

multiply.by(4, 5)
## cannot add/pass more than accepted arguments
multiply.by(4, 5, 8) # Error: unused argument (8)
## cannot pass less than required arugments
multiply.by(4) # argument "multiplier" is missing, with no default

"To avoid fixed number of arguments, you can use default arguments or ellipsis '...' "
## Default arguments (optional arugments)
xy <- 10
multiply.by <- function (number, multiplier = 3) {
  
  number * multiplier
}

multiply.by(4, 5) # override the default argument
multiply.by(4)

### Check if an argument is supplied/passed
name.prefix <- function(name, prefix = NULL) {
  force(prefix)
  if (!is.null(prefix)) {
    print('I\'m true condition')
    name <- paste(prefix, name)
    c(name, 'Guy')
  }
  name
}

formal.name <- name.prefix('Hamoud', 'Mr.')
formal.name
formal.name <- name.prefix('Hamoud')
formal.name

# Check if argument is missing
i <- function(a, b = NULL) {

  if (missing(a)) {
    
    return('a is missing')
  }
  
   if (a == 4) {
     a <- 4
     print('a is four')
   }
  
   # if (is.null(b)) {
   #   return('b is null')
   # }
   
  print('last expression')
  c(missing(a), missing(b))
}
i('a arg')

## `...` The-three-dots-argument
"This argument will match any arguments not otherwise matched"
f <- function (name, ...) {
  print(paste('You sent this name', name))
  
  extra.arguments <- list(...)
print(extra.arguments)
  if ('age' %in% names(extra.arguments)) {
    print('You sent age argument')
  }
  
  # print(extra.arguments)
  
  # ... will be a named list containing all other arguments
  # print(list(...))
}


f('Hamoud', agesd = 32, gender = 'Male', 'Student')


## Actual arguments
"
What arguments are passed when the function is called
"
### 4 & 5 are actual arguments passed to the function.
multiply.by(4, 5)

### Named arguments vs positional arguments
formals(matrix)
matrix()
# If you use/pass all args as named arguments the order does not matter 
matrix(data = 1:30, nrow = 5, ncol = 6, byrow = T) 
matrix(byrow = T, ncol = 6, nrow = 5, data = 1:30)

# Pass all arguments as positional arguments (without names)
matrix(1:30, 5, 6, T) 
# The order must match the formal arguments positions as written in the function source code.

matrix(1:30, byrow = T, 5, 6)

### Exact vs Partial Matching
matrix(1:30, nr = 5, nc = 6, b = T)

matrix(nc = 6, da = 1:30)

matrix(nrow = 5, byrow = T) 

matrix(byrow = T, nrow = 5, 1:30, 6)
matrix(data = 1:30, ncol = 6, 5, T)

matrix(byrow = T, nrow = 5, 6, 1:30)

## Mapping actual to formal arguments
"
Order of evaluation:
1) Named arguments. Exact matching and then partial mathcing. Removed from arglist.
2) Positional arguments. As listed in formal args after removing named args.
3) Three-dots-argument
"
f <- function(abcdef, bcde1, bcde2, ...) {
  print(list(....))
  list(a = abcdef, b1 = bcde1, b2 = bcde2)
}
str(f(1, 2, 3)) # by order
str(f(2, 3, abcdef = 1)) # by exact name first, then by order
str(f(2, 3, a = 1)) # by partial matching
str(f(1, 3, b1 = 2, bcde2=  )) # d

mean()


data.frame(col.name.1 =c(1:10))

plot(
  y = 1:10,
  x = 1:10,
  xlab = 'X col',
  ylab = 'Y Title',
  main = 'My Chart',
  sub = 'Sub Title'
)

"
Tip: positional matching for the first one or two arguments; they will be the most commonly used, and most readers will know what they are. Avoid using positional matching for less commonly used arguments
"

# Arguments evaluation (lazy evaluation)
multiply.by <- function(number, multiplier) {
  number * 10
}

multiply.by(3)
multiply.by(3, 10)
multiply.by(3, 3, 9) # unused argument (9)


f <- function(x) {
  # x
  # force(x)
  10
}
f(stop("This is an error!"))

add <- function(x) {
  # force(x) # b/c is not evaluated, the value of x will
  function(y)
    x + y
}
adders <- lapply(1:10, add)
adders[[1]](10)

## `...` The-three-dots-argument
?plot
str(plot)

### Simple usage
plot(1:10, 1:10)

### With extra arguments
plot(
  seq(10, 100, by = 10),
  1:10,
  type = "b",
  main = 'Title For My Chart',
  xlab = 'x title',
  col = "red"
)
summary(par())

draw.my.chart <- function(data, ...) {
  x <- sample(data, 10)
  y <- sample(data, 10)
  plot(x, y, ...)
}

data <- matrix(1:25, nrow = 5)

draw.my.chart(
  data = matrix(1:25, nrow = 5),
  type = "h",
  main = 'Updated Title For My Chart',
  sub = 'subtitle',
  xlab = 'x title',
  col = "red"
)

"https://cran.r-project.org/doc/manuals/r-release/R-intro.html#The-three-dots-argument"

# Function Body -----------------------------------------------------------
## Return Value
## Invisible

# Environments ------------------------------------------------------------

## Scoping Rules
"
R has seperate namespacing for functions and non-functions.
How are look up the envs, using search() and the order.
"
c <- 'as'
c(1, 2)
c <- function (x, y) {
  x * y
}
c(3, 2)


parent.env(globalenv())

"
Global environment.
Variables defined inside functions have diffirent env.
"
x <- 2
g <- function() {
  y <- 1
  c(x, y)
}
g()
rm(x, g)

# Nested functions
first <- function(x, y) {
  z <- x + y
  return(z)
}
add <- function(a, b) {
  return(a + b)
}
vector <- c(3, 4, 5, 6)

sapply(vector, add, 1)

x <- 5
f <- function() {
  y <- 10
  c(x = x, y = y)
}
f()

x <- 5
g <- function() {
  x <- 20
  y <- 10
  c(x = x, y = y)
}
g()
x <- 5
h <- function() {
  y <- 10
  i <- function() {
    z <- 20
    c(x = x, y = y, z = z)
  }
  i()
}
h()




# Functions to do with functions ----
# Functions to do with functions
# function (keyword)
missing() # or is.null() to check if arg is passed
force(args)
on.exit()
invisible()
return()
attributes(f) # $srcref is source reference which shows exact code
class()
print(f)
invisible()
print()
args()
rm()
search()
do.call()

# Resources
"https://ramnathv.github.io/pycon2014-r/learn/functions.html"
"https://swcarpentry.github.io/r-novice-inflammation/02-func-R/"
"https://www.datacamp.com/community/tutorials/functions-in-r-a-tutorial"
