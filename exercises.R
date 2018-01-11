x <- c(3,7,1)

x
"
Ex 3: Create a script that given a numeric vector x with a length 3, will print out the elements in order from high to low. You must use if,else if, and else statements for your logic. (This code will be relatively long)
"

y <- vector()
if (x[1] > x[2] && x[1] > x[3]) {
  y[1] <- x[1]
} else if ( x[2] > x[1] && x[2] < x[3] ){
  y[1] <- x[2]
} else {
  y[1] <- x[3]
}

y
