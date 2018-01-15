
# Creating Factors --------------------------------------------------------

# Read factor() documentations
?factor

# Create empty factor with 0 levels
fac.empty <- factor()
str(fac.empty)

# Create factor from a vector of length 10
fac.1 <- factor(1:10)

fac.2 <- factor(rep(1:5, 3))
levels(fac.2)

# Create a factor with levels
fac.3 <- factor(sample(letters[1:4]), levels = letters[1:5])
fac.4 <- factor(sample(letters[1:4], 10, replace = T), levels = letters[1:5])

# Create ordered factor
fac.5 <- factor(sample(letters[1:4], 10, replace = T), ordered = T)


is.ordered(fac.3)
is.ordered(fac.5)


