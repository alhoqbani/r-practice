


############ Creating Matrices ############

mat0 <- matrix() # empty matrix
mat1 <- matrix(1:30) # matrix with one single column
# nrow & ncol
mat2 <- matrix(1:30, nrow = 5)
mat3 <- matrix(1:30, ncol = 3)
# mat4 <- matrix(1:30, nrow = 4) # can't make it 4 rows b/c 30 can't divided by 4
# mat4 <- matrix(1:30, ncol = 4) # can't make it 4 cols b/c 30 can't divided by 8 (rows)
mat4 <-
  matrix(1:30, nrow = 3, ncol = 15) # ncol is more than expected 10, so values are repeated (recycled)
mat4 <-
  matrix(1:30, nrow = 3, ncol = 5) # ncol is less than expected 10, so values are incomplete
# byrow
mat5 <- matrix(1:30, byrow = F, nrow = 6) # default: byrow = F
mat6 <- matrix(1:30, byrow = T, nrow = 6)

# dimnames
"
We can add the names of rows and columns using `dimnames` argument.
This argument takes a list of two vectors.
The list can be named, in which case the names will be assigns to the dims
This exast list will be return when `dimnames()` is called.
"
mat7 <- matrix(1:8, nrow = 2, dimnames = list(1:2, 1:4))
mat8 <-
  matrix(1:8, nrow = 2, dimnames = list(letters[1:2], LETTERS[1:4]))
mat9 <- matrix(1:8,
               nrow = 2,
               dimnames = list(
                 rows.names = c('row.first', 'row.second'),
                 cols.names = c('col.1', 'col.2', 'col.3', 'col.4')
               ))

mat10 <-
  matrix(
    1:8,
    nrow = 2,
    ncol = 4,
    byrow = T,
    dimnames = list(
      rows.names = c('row.first', 'row.second'),
      cols.names = c('col.1', 'col.2', 'col.3', 'col.4')
    )
  )

# To get the list of dimnames
dimnames(mat7)
# return NULL when there are no names
dimnames(mat3)
# To get the `dim` (number of rows and columns)
dim(mat7)
dim(mat3)


# Creating matrixes using as.matrix()
mat.as <- as.matrix(1:10, nrow = 5)
# Change data.frame
mat.mtcars <- as.matrix(mtcars)
is.matrix(mtcars); is.data.frame(mtcars) 
is.matrix(mat.mtcars); is.data.frame(mat.mtcars)
dim(mtcars) # number of rwos and cols
dimnames(mtcars) # List of cols and rows names



############ NamingColumns and Rows ############ 