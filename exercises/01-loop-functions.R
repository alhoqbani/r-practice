
"Exercise 1:
create a function to calcualte the median for every column in any data frame, for example mtcars or airquality"

# This function takes a data frame and returns a vector integer with the median for every coloumn
col_median <- function(df) {
  # Your Code Here
  
}

# Test the function with mtcars only, don't use airquality for now.

mtcars.col.median <- col_median(mtcars)
str(mtcars.col.median)
names(mtcars.col.median) <- colnames(mtcars)

"Exercise 2:
create a function to calcualte the mean for every column in any data frame, mtcars or airquality for example. Don't use str(colMeans(mtcars))"
# This function takes a data frame and returns a vector integer with the mean for every coloumn
col_mean <- function(df) {
  # Your Code Here

}

mtcars.col.mean <- col_mean(mtcars)
str(mtcars.col.mean)

"Exercise 3:
create a function to calcualte the standard deviation for every column in any data frame, mtcars or airquality for example."
# This function takes a data frame and returns a vector integer with the standard deviation for every coloumn
col_sd <- function(df) {
  # Your Code Here
  
}

mtcars.col.sd <- col_sd(mtcars)
str(mtcars.col.sd)


"Exercise 4:
Replace all the above three functions with one function called col_summary().
"
# This function takes a data frame and a function. It applys the function to every column in the data frame, and returns the result.
col_summary <- function(df, func) {
  # Your Code Here
  
}

mtcars.col.mean <- col_summary(mtcars, mean)
str(mtcars.sum.mean)

mtcars.sum.median <- col_summary(mtcars, median)
str(mtcars.sum.median)

mtcars.sum.sd <- col_summary(mtcars, sd)
str(mtcars.sum.sd)

"
Exercise 5
Test you functions with airquality and fix them if there is any error
"
airquality.median <- col_summary(airquality, mean)
colMeans(airquality)

# How to get red of the 'NA' ?
col_summary <- function(df, func, ...) {
  # Your Code Here
  
}



col_summary(airquality, mean, na.rm = T)







