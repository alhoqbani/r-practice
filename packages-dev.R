# Prepare development environment ----

# 1) Install required/recommended packages

# devtools (automate common development tasks)
# roxygen2 (generate documentation)
# testthat (automated tests)
# knitr (report generation for Vignettes)

install.packages(c("devtools", "roxygen2", "testthat", "knitr"))

# 2)  Verify environment is ready for packages development
library(devtools)
has_devel() # This should return TRUE


# Create new package using RStudio ----
# 1) File > New Project > New Directory >  R Package

# 2) Fill the details: (choose a name, location and enable git reposoptiry)
"
Name of the package requirements:
- can have only: letters, numbers and periods
- must start with a letter
- cannot end with a period
"


# Create your custom functions ----
"
Inside the R folder, create a new R script and add your custom functions.
"

devtools::install_local('../packages/AlhoqbaniPackage')
devtools::check()
dir <- tempfile()
dir.create(dir)
pkg <- download.packages("testthat", dir, type = "source")
install_local('/Users/hamoud/Documents/Code/R/Packages/AlhoqbaniPackage/')



# Resources ----
"http://r-pkgs.had.co.nz/"
"https://www.datacamp.com/community/tutorials/r-packages-guide"