# Define symbols/variables for practice -----------------------------

df.mtcars <- mtcars

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

df.students <- as.data.frame(mat.students, stringsAsFactors = F)

my.list = list(c(1, 2, 3),
               list(c('hamoud', 'abdu', 'zezo'),
                    c(33, 44, 55)),
               list(mtcars,
                    df.students))


# 1) Subsetting Variables (columns) ---------------------------------
"
Three ways to get Variables (columns): 
1 - single-bracket notation. (without comma)
2 - single-bracket notation. (with comma)
3 - dollar sign ($)

Subsetting varaibles or columns using bracket notation.
1) Without comma []
basic rule df[column name or index] # 'no comma'
we don't use comma inside the brackets. (single dimention)
This single-braket notation will select only columns.
The return value will always be data.frame
"

# This will return the same column (as df): mpg b/c its index is 1
df.mtcars[1]
df.mtcars['mpg']

# This will return 3 columns (mpg cyl disp)
df.mtcars[1:3]
df.mtcars[c('mpg', 'cyl', 'disp')]

# This will return 2 columns: 1st. and 4th.
df.mtcars[c(1, 4)]
df.mtcars[c('mpg', 'hp')]

# Only the columns with name has 't'
df.mtcars[grep('t', names(df.mtcars))]

"
Subsetting varaibles or columns using bracket notation.
2) With comma [,]
"
# Return first column for all rows.
# Will return a vector b/c one column can be converted to vector
df.mtcars[, 1]
df.mtcars[, 'mpg']
# adding `drop = F` will force to return data.frame
df.mtcars[, 1, drop = F]
df.mtcars[, 'mpg', drop = F]

# When subsetting two columns or more, the returned object will be always data.frame
df.mtcars[, 1:3]
df.mtcars[, c(3, 5, 6)]
df.mtcars[, c('mpg', 'hp', 'cyl')]

"
3) Subsetting varaibles or columns using dollar sign ($)
"
df.mtcars$mpg
df.mtcars$hp # This similar to df.mtcars[, 'hp'] (notice the comma)

# 2) Subsetting Observations (rows) ---------------------------------
"
To choose which rows are return in the subset, we use the first part of the bracket notation
"
# Return the first row (with all columns)
df.mtcars[1 ,]
# Return first three rows
df.mtcars[1:3 ,] # The comma is important. Without comma, you'll get first three varaibles/cols
# Select specific rows by index:
df.mtcars[c(5, 2, 7, 32), ]
# You can also get rows by using row names
df.mtcars['Hornet Sportabout', ]
df.mtcars[c('Hornet Sportabout', 'Volvo 142E'), ]
# In the students df, the rows name are string numbers
# Return student number 3: (using index number and row name)
df.students['3',]
df.students[3,]

"
We can use logical vectors to select rows based on the condition
"
df.mtcars[df.mtcars['mpg'] > 20, ]
df.mtcars[df.mtcars['mpg'] > 20 & df.mtcars['cyl'] == 6, ]
# NO RESULTS. b/c no rows match the condition
df.mtcars[df.mtcars['mpg'] > 20 & df.mtcars['cyl'] == 9, ] 
"
When you need to select rows conditionally based on variables/columns values,
you need to choose the columns to evaluate/comapre
this can be done using bracket notation (as the above example) or dollar sign ($)
"
# Cars with hp greater than 200
df.mtcars[df.mtcars['hp'] > 200 , ] # using df.mtcars['hp'] (bracket notation)
df.mtcars[df.mtcars$hp > 200 , ] # using df.mtcars$hp (dollar sign)

# Cars with hp greater than 200 with only the hp and mpg variables
df.mtcars[df.mtcars['hp'] > 200 , c('hp', 'mpg')] # using df.mtcars['hp'] (bracket notation)
df.mtcars[df.mtcars$hp > 200 , c('hp', 'mpg')] # using df.mtcars$hp (dollar sign)

# Let's get only the Female students
df.students[df.students$gender == 'Female' , ]
df.students[df.students['gender'] == 'Female' , ]


# 3) Subsetting Varaibles and Observations --------------------------
"
We can use bracket notation to specify which rows AND columns to return
"
# Get first three rows with only mpg column
df.mtcars[c(1:3), 'mpg', drop = T] # Return a vector (default)
df.mtcars[c(1:3), 'mpg', drop = F] # Return a data.frame
# Cars with hp 200 and above, and get only cyl, hp, gear columns
df.mtcars[df.mtcars['hp'] >= 200, c('cyl', 'hp', 'gear')]

# Notice: subsetting rows with only one column will return a vector
df.mtcars[1:3, 1]
df.students[2:4, 'age']

# This can be done also using dollar sign notation
df.mtcars[1:3, ]$mpg
df.students[2:4, ]$age


# 4) Subsetting using double-bracket notation `[[`

# This will return the first column values as a vector (similar to df.mtcars$mpg)
df.mtcars[[1]] 
# Similar to 
df.mtcars$mpg # and df.mtcars[, 1]

# We can add more subsetting to choose a single value from the returned vector
df.mtcars[[c(1, 4)]] # Notice: we are using c() here

# Select only three rows and then get the value of the first column
df.students[1:3,][[1]]
# Same as 
df.students[1:3,]$name
# Same as 
df.students$name[1:3]
" So confusing, I know "


# More complex examples: 
# Get the three names from the my.list
my.list[[c(2, 1)]]
# Same as:
my.list[[2]][[1]]

# Get the second age of zezo:
my.list[[c(2, 2, 3)]]
# Same as 
my.list[[2]][[2]][3] # Notice last one is single-braket, b/c it's a vector


# Get the names of the students: (df.students is a data.frame inside list inside another list)
my.list[[c(3, 2, 1)]]
# Same as 
my.list[[3]][[2]][[1]]
# Same as 
my.list[[3]][[2]]$name
# Same as 
my.list[[3]][[2]][1] # This returns data.frame
# Same as 
my.list[[3]][[2]]['name'] # This returns data.frame
# Same as
my.list[[3]][[2]][, 'name'] 

# Get the sutdents data frame out of my.list
new.df.students <- my.list[[c(3 , 2)]]
# or
new.df.students <- my.list[[3]][[2]]

# Get the age of Sara from df.students inside my.list
my.list[[c(3, 2)]][df.students['name'] == 'Sara', 'age'] # notice: df.students is not the same one insede my.list, but it WORKS!!
my.list[[c(3, 2)]][my.list[[c(3, 2, 1)]] == 'Sara', 'age']

# Finally, get some arbitrary values from df.mtcars
my.list[[c(3, 1, 4, 29)]]


# Some useful resources ---------------------------------------------
?'[.data.frame'
"https://rpubs.com/tomhopper/brackets"
"http://adv-r.had.co.nz/Subsetting.html"
