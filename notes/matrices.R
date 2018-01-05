




############ Creating Matrices ############

mat.0 <- matrix() # empty matrix
mat.1 <- matrix(1:30) # matrix with one single column
# nrow & ncol
mat.2 <- matrix(1:30, nrow = 5)
mat.3 <- matrix(1:30, ncol = 3)
# mat.4 <- matrix(1:30, nrow = 4) # can't make it 4 rows b/c 30 can't divided by 4
# mat.4 <- matrix(1:30, ncol = 4) # can't make it 4 cols b/c 30 can't divided by 8 (rows)
mat.4 <-
  matrix(1:30, nrow = 3, ncol = 15) # ncol is more than expected 10, so values are repeated (recycled)
mat.4 <-
  matrix(1:30, nrow = 3, ncol = 5) # ncol is less than expected 10, so values are incomplete
# byrow
mat.5 <- matrix(1:30, byrow = F, nrow = 6) # default: byrow = F
mat.6 <- matrix(1:30, byrow = T, nrow = 6)

# dimnames
"
We can add the names of rows and columns using `dimnames` argument.
This argument takes a list of two vectors.
The list can be named, in which case the names will be assigns to the dims
This exast list will be return when `dimnames()` is called.
"
mat.7 <- matrix(1:8, nrow = 2, dimnames = list(1:2, 1:4))
mat.8 <-
  matrix(1:8, nrow = 2, dimnames = list(letters[1:2], LETTERS[1:4]))
mat.9 <- matrix(1:8,
                nrow = 2,
                dimnames = list(
                  rows.names = c('row.first', 'row.second'),
                  cols.names = c('col.1', 'col.2', 'col.3', 'col.4')
                ))

mat.10 <-
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
dimnames(mat.7)
# return NULL when there are no names
dimnames(mat.3)
# To get the `dim` (number of rows and columns)
dim(mat.7)
dim(mat.3)


# Creating matrixes using as.matrix()
mat.as <- as.matrix(1:10, nrow = 5)
# Change data.frame
mat.mtcars <- as.matrix(mtcars)
is.matrix(mtcars)
is.data.frame(mtcars)
is.matrix(mat.mtcars)
is.data.frame(mat.mtcars)
dim(mtcars) # number of rwos and cols
dimnames(mtcars) # List of cols and rows names


## Real data matrices
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


############ Naming Columns and Rows ############
mat.cols.1 <- matrix(1:30, nrow = 6, byrow = T)
mat.cols.2 <- matrix(1:20, nrow = 4, byrow = T)

## set and get colnames
colnames(mat.cols.1) # get colnames, returns NULL b/c no colnames
# set colnames
colnames(mat.cols.1) <- c('col.name.1', 'col.name.2', 'col.name.3', 'col.name.4', 'col.name.5')
colnames(mat.cols.1) # get colnames, returns char vector of 5
# argument: do.NULL. Will create colnames if there is no names (names are NULL).
colnames(mat.cols.2, do.NULL = F)
colnames(mat.cols.2, do.NULL = F, prefix = 'my.col.auto.name.')


## set and get rows
rownames(mat.cols.1) # get rownames, returns NULL b/c no rownames
# set rownames
rownames(mat.cols.1) <- seq(10, 60, by = 10)
rownames(mat.cols.1) # get colnames, returns char vector of 5
# argument: do.NULL. Will create colnames if there is no names (names are NULL).
rownames(mat.cols.2, do.NULL = F)
rownames(mat.cols.2, do.NULL = F, prefix = 'my.row.auto.name.')

# Trick to give rownames only if there is no rownames:
colnames(mat.cols.1) <- colnames(mat.cols.1, do.NULL = F, prefix = 'my.col.auto.name.') # rownames will not be changed b/c it was already named.
colnames(mat.cols.2) <- colnames(mat.cols.2, do.NULL = F, prefix = 'my.col.auto.name.') # colnames will be assigne to the auto names b/c there was no names.


############ Merging and Adding to Matrices ############
mat.com.1 <- matrix(1:10, nrow = 5, ncol = 2)

# Add extra rows: (by vector)
rbind(mat.com.1, c(101, 102))
# Add extra columns: (by vector)
cbind(mat.com.1, c(201, 202, 203, 204, 205))
# If we add a vector variable, the variable name will be the row or column name
v.named <- c(201, 202, 203, 204, 205)
cbind(mat.com.1, v.named)
rbind(mat.com.1, quick.v.row = c(11,22)) #inline naming

mat.com.2 <- matrix(1:8, nrow = 4, ncol = 2)
mat.com.3 <- matrix(101:108, nrow = 4, ncol = 2)
# We can bind both matrecis as rbind or cbind b/c they share the same `dim`
mat.com.3.rbind <- rbind(mat.com.2, mat.com.3)
mat.com.3.cbind <- cbind(mat.com.2, mat.com.3)

mat.com.4 <- matrix(101:116, nrow = 4)
# mat.com.4.rbind <- rbind(mat.com.2, mat.com.4) # Can't do it b/c they have diffirent cols count
mat.com.4.cbind <- cbind(mat.com.2, mat.com.4)

mat.com.5 <- matrix(101:116, ncol = 2)
mat.com.5.rbind <- rbind(mat.com.2, mat.com.5) 
# mat.com.5.cbind <- cbind(mat.com.2, mat.com.5) # Can't do it b/c they have diffirent cols count


# What if we have colnames and rownames?
rownames(mat.com.2) <- rownames(mat.com.2, do.NULL = F)
colnames(mat.com.2) <- colnames(mat.com.2, do.NULL = F)
rbind(mat.com.2, mat.com.3)
cbind(mat.com.2, mat.com.3)
rownames(mat.com.3) <- rownames(mat.com.3, do.NULL = F, prefix = 'new.row')
rbind(mat.com.2, mat.com.3)


############ Indexing and Slicing Matrices ############


t(mat.com.2)
c(mat.com.2)

