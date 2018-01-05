# Creating Vectors

v <-  c(1:100)
v1 <-  1:100
v2 <- letters[1:20]
x <- c(100, 89, 100, 90, 50)
d <- c("Mon", "Tue", "Wed", "Thu", "Fri")

# Create from data
mpg1 <- mtcars$mpg # Return Vector
mpg2 <- mtcars[c('mpg', 'cyl')] # This will return data.frame
mpg3 <- mtcars[['mpg']] # This will return vector

# Naming Vectors
names(x) <- d

# test with names less than length
names(d) <- c("Feb", "Mar", "")
# names(d) <-  LETTERS[1:10] This will not work b/c letters > len(d)

# Changing names
names(x)[5] <- "Sun"
x
# Removing nmaes
names(x) <-  NULL
x
names(x) <-  d
x
"
Mon Tue Wed Thu Fri
100  89 100  90  50
"
# Indexing & Slicing

x[1]
x[3:5]
x[-3]
x.sub <- x[3]
is.vector(x)
class(x[[3]])
x[c(1, 3, 5)]
x["Fri"]
x[c("Tue", "Wed")]
logical.filter <- x > 90
x[logical.filter]
x[c(T, F, T, F, F)]
x[x < 100 & x %% 2 == 1]
d[is.na(names(d))]
d[names(d) == '']


names <- c('Mike', 'John', 'Merry', 'John', 'Philip Prince')
names[names %in% c('John', 'Philip')]
names[names %in% c('John', 'Philip')] <- c('Changed', 'new')

# Adding to and merging vectors
x[6] <- 66
names(x)[6] <- "Sat"
x[10] <- 109

x[c(7, 8)] <- c(10, 20)
y <- c(x, d)

# Operations
x.celcuis <-  x / 2
x["Wed"] <- 70
x[c("Mon", "Thu")] <-  44
x[c("Mon", "Thu")] <-  c(44, 45)
x[x %% 2 == 0] <- x[x %% 2 == 0] + 3

sum(x)

is.vector(x)
is.logical(logical.filter)
is.character(d)
is.numeric(v)
is.integer(v)
is.integer(x)
barplot(x)

x[order(x)]
x[order(-x)]
