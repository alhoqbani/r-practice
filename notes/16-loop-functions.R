# Introduction ------------------------------------------------------------

"
I divide the `apply family` functions into three groups:
1) lapply, sapply, vapply, ...
2) tapply and split
3) apply

"


# lapply, sapply, vapply, ... ---------------------------------------------



# lapply ------------------------------------------------------------------



str(lapply) # function (X, FUN, ...)


# Loop every element of X, apply FUN to every element, and return `a list` of the result
# X is either a vector or list, other objects will be converted to list: as.list()
lapply(X = 1:10, function(x) x * 10)
lapply(X = 1:10, sqrt) # Return list of 10 elements, with sqrt of every element of X

list.of.vec <- list(1:10, 1:20, 1:30)
# Calculate mean for every vector in the list
lapply(X = list.of.vec, mean)
View(mtcars)
# What the returned value?
lapply(mtcars, mean)
# Calculate mean of every column in airquality
lapply(X = airquality, mean) # What about NA?
lapply(X = airquality, mean, na.rm = TRUE)
# Compare with
colMeans(airquality, na.rm = T)
# Difference: lapply converts the df to list before calculate the mean


char.vec <- c('Word 1', 'Another Word', 'More Words')
# Calculate number of chars in every vectory
lapply(X = char.vec, nchar)
lapply(X = list(char.vec, char.vec), nchar)


# Find column names for these dataset: mtcars, airquality, stat.x77, CO2
lapply(list(mtcars, airquality, state.x77, CO2), colnames)

# PS. the lenght of the returned list will always be same as length of X



# sapply ------------------------------------------------------------------

# sapply is a user-friendly version and wrapper of lapply by default returning a vector, matrix or, if simplify = "array", an array if appropriate, by applying simplify2array(). sapply(x, f, simplify = FALSE, USE.NAMES = FALSE) is the same as lapply(x, f).


# Go back and try sapply to every example obove.



# vapply ------------------------------------------------------------------



# replicate ---------------------------------------------------------------




# Part 2: tapply and split ------------------------------------------------

# split and unsplit
?split
str(split) # function (x, f, drop = FALSE, ...)  

# Split mtcars by cyl
str(split(mtcars, mtcars$cyl))
# Split airquality by month
str(split(mtcars, airquality$Month))

as.factor(mtcars$cyl)
str(as.factor(mtcars$cyl))


# Let's load the patients.data data.frame
load('data/r-novice-inflammation/patients.data.rda')

split(patients.data, patients.data$group)



# tapply: "https://www.r-bloggers.com/r-function-of-the-day-tapply-2/"
?tapply

tapply(mtcars$mpg, mtcars$cyl, mean)
tapply(airquality$Ozone, airquality$Month, mean, na.rm = T)


tapply(patients.data$bloodpressure, list(patients.data$gender, patients.data$group), median)


## contingency table from data.frame : array with named dimnames
tapply(warpbreaks$breaks, warpbreaks[,-1], sum)
tapply(warpbreaks$breaks, warpbreaks[, 3, drop = FALSE], sum)

# apply -------------------------------------------------------------------

str(apply)
# function (X, MARGIN, FUN, ...)  


# MARGIN = a vector giving the subscripts which the function will be applied over. 
# MARGIN = for a matrix 1 indicates rows, 2 indicates columns, c(1, 2) indicates rows and columns. 
# MARGIN = dim(X)

apply(1:30, 1, mean) # Error: dim(X) must have a positive length
dim(1:30) # NULL

mat <- matrix(1:30) # matrix here is one column
apply(mat, 1, sqrt) # Apply sqrt() to every row
apply(mat, 2, sqrt) # Apply sqrt() to every col

sqrt(1:2)





