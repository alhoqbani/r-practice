# Short manual for creating you own package.

# Prepare development environment -----------------------------------------


# 1) Install required/recommended packages
"
devtools (automate common development tasks)
roxygen2 (generate documentation)
testthat (automated tests)
knitr (report generation for Vignettes)
"

install.packages(c("devtools", "roxygen2", "testthat", "knitr"))

# 2)  Verify environment is ready for packages development
library(devtools)
has_devel() # This should return TRUE



# Create new package using RStudio ----------------------------------------



# 1) Create the package files using RStudio
"
1. File > New Project > New Directory >  R Package
2. Fill the details: 
    - choose a name: package name requirements:
        * can have only: letters, numbers and periods
        * must start with a letter
        * cannot end with a period
    - location where the project file should be saved.
    - Check enable  git reposoptiry.
    - Check open in new session.
"

# 2) Add and commit the files to git
"
git status
git add .
git status
git commit -m 'Initial commit'
git status
"

# Write Package Functions -------------------------------------------------
"
All custom R scripts for the package should be stored in the `R` directory.
"


"
Create a new R script and save it to the R folder inside the pacakge project
directory. You can choose any name to the file, but it's recommended to 
choose a name that describes the purporse of the functions inside the file.
You can put each function in a seperate file, or groups related functions 
into one file.
"


# Using Your Package ------------------------------------------------------

# 1) Loading the package from local location
"
From you project, e.g. (r-Practice), load your new pacakge to use it.
devtools::install_local('path/to/package')
library(PackageName)
"

# 2) Loading the package from github.com

# Add your new files and all changes to git:
"
git status
git add .
git commit -m 'Add pacakge custom functions'
"
# Create a reposotiry in github and push the package:
"www.github.com/username/packagename"
"
git remote add origin git@github.com:username/packagename.git
git push -u origin master
"

# Install the pacakge to your library.
devtools::install_github('username/packagename')

# Load the package
library(packagename)




# Resources ---------------------------------------------------------------


"http://r-pkgs.had.co.nz/"
"https://www.datacamp.com/community/tutorials/r-packages-guide"