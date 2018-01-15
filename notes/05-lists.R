
# Creating Lists ----------------------------------------------------------

lis.empty <- list()
class(lis.empty)
str(lis.empty)

# List of vectors
lis.vec <- list(1:30, 1:15, 30:1)
str(lis.vec)

# List can have diffirent types
lis.mix.1 <- list(1:20, letters[1:10])
str(lis.mix.1)
lis.mix.2 <- list(sample(LETTERS, 5), airquality)
str(lis.mix.2)

# List can have other lists
lis.lis <- list(
  lis.mix.1,
  lis.mix.2,
  matrix(runif(10)),
  rep('a', 20),
  list(1, 2, 3, list(4, 5), list(6, list(7, 8)))
)
str(lis.lis)


# Named list

lis.named.1 <- list(numbers = 1:30, letters = letters[1:10])
str(lis.named.1)
names(lis.named.1)

# We can set names to unnamed list
# Check the names
names(lis.lis)
# Set the names
names(lis.lis) <-
  c('Mixed List',
    'More Mixed List',
    'Matrix',
    'Repeated A',
    'Nested List')

str(lis.lis)

# We don't like spaces when naming things in R, let's fix it
names(lis.lis) <- make.names(names(lis.lis))
str(lis.lis)


# Inspecting Lists --------------------------------------------------------
class(lis.named.1)
str(lis.named.1)
attributes(lis.named.1)
attr(x = lis.named.1, 'name')
length(lis.lis)

# Lists are single-dimension objects
dim(lis.named.1) # NULL
dimnames(lis.named.1) # NULL
nrow(lis.named.1) # NULL



# Subsetting --------------------------------------------------------------

# 1) Single-Bracket Operator `[`
# 2) Double-Bracket Operator `[[`
# 3) Dollar Sign Operator `$`

str(lis.lis)

# 1) Single-Bracket Operator `[`
"extracts a sub-list. The result will always be a list."

lis.lis[1]
str(lis.lis[1])

lis.lis[4]
str(lis.lis[4])

lis.lis[2:5]
str(lis.lis[2:5])

lis.lis[c(1, 3, 4)]
str(lis.lis[c(1, 3, 4)])

# 2) Double-Bracket Operator `[[`
"extracts a single component from a list. It removes a level of hierarchy from the list."
lis.lis[[1]]
str(lis.lis[[1]])

lis.lis[[4]]
str(lis.lis[[4]])

lis.lis[[5]]
str(lis.lis[[5]])


# 3) Dollar Sign Operator `$`
"a shorthand for extracting named elements of a list. It works similarly to [[ except that you don’t need to use quotes"

lis.lis$Mixed.List
str(lis.lis$Mixed.List)

lis.lis$Repeated.A
str(lis.lis$Repeated.A)


# Food for though:
"What happens if you subset a data frame as if you’re subsetting a list? What are the key differences between a list and a data frame?"
lis.lis <- mtcars # Redo the above subsetting




# Resources ---------------------------------------------------------------

links <- list(
  'http://r4ds.had.co.nz/lists.html'
)
str(links)
