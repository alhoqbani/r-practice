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

func.name <- function (arglist)  {
  # body (expr)
}

# from help('function')
function(arglist)
  expr
return(value)


# Define a function
add.three <- function(arg.1) {
  arg.1 + 3
}
# Call the function
add.three(4) # same as 4 + 3
add.three(1:10)  # same as 1:10 + 3
# Inspect the function
add.three # Print the function
print(add.three)
class(add.three)
str(add.three)
attributes(add.three)
formals(add.three) # list of arguments the function "accept"
args(add.three) # use only interactively
body(add.three) # the body of the function (block code between curly braces)
environment(add.three)

# Task one: functions to convert between c to f temprutres
"
formulas: 30°C x 1.8 + 32 = 86°F; (50°F - 32) x .5556 = 10°C
"
c.to.f <- function (c.temp) {
  
}
f.to.c <- function (f.temp) {
  
}

# Task two: function to add 2nd arg before and after 1st func
"
Input = two vectors, output one vector: first and last element is vector 2
"
wrapper <- function (vec.1, vec.2) {
  
}

# Task three: return first and last of vector
outsiders <- function (x) {
  
}

# Task four: return random month name
rand.month <- function () {
  index <- sample(seq(month.name), 1)
  month.name[index]
}
rand.month()



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

## number & multiplier are (two) formal arguments accepted by the arguments.
multiply.by <- function (number, multiplier) {
  number * multiplier
}
multiply.by(4, 5)
## cannot add/pass more than accepted arguments
multiply.by(4, 5, 8) # Error: unused argument (8)
## cannot pass less than required arugments
multiply.by(4) # argument "multiplier" is missing, with no default

"To avoid fixed number of arguments, you can use default arguments or ellipsis '...' "
## Default arguments
multiply.by <- function (number, multiplier = 3) {
  number * multiplier
}
multiply.by(4, 5) # override the default argument
multiply.by(4)

### Check if an argument is supplied/passed
name.prefix <- function(name, prefix = NULL) {
  if (!is.null(prefix)) {
    name <- paste(prefix, name)
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
    return()
  }
  if (is.null(b)) {
    return('b is null')
  }
  c(missing(a), missing(b))
  print(a)
}
i(1, b = 3)

## `...` The-three-dots-argument
"This argument will match any arguments not otherwise matched"
f <- function (name, ...) {
  # ... will be a named list containing all other arguments
  print(list(...))
}
f('Hamoud', age = 32, gender = 'Male', job = 'Student')

## Actual arguments
"
What arguments are passed when the function is called
"
### 4 & 5 are actual arguments passed to the function.
multiply.by(4, 5)

### Named arguments vs positional arguments
matrix(data = 1:30, nrow = 5, ncol = 6, byrow = T)
matrix(1:30, 5, 6, T)
matrix(byrow = T, nrow = 5, data = 1:30,  ncol = 6)
matrix(1:30, byrow = T, 5, 6)

### Exact vs Partial Matching
matrix(1:30, nr = 5, nc = 6, b = T)

## Mapping actual to formal arguments
"
Order of evaluation:
1) Named arguments. Exact matching and then partial mathcing. Removed from arglist.
2) Positional arguments. As listed in formal args after removing named args.
3) Three-dots-argument
"
f <- function(abcdef, bcde1, bcde2) {
  list(a = abcdef, b1 = bcde1, b2 = bcde2)
}
str(f(1, 2, 3)) # by order
str(f(2, 3, abcdef = 1)) # by exact name first, then by order
str(f(2, 3, a = 1)) # by partial matching
str(f(1, 3, b = 1)) # doesn't work b/c matching is ambiguous
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
