#!/usr/bin/env Rscript


# To get the arguments from command line: 
arguments <- commandArgs(trailingOnly = T)
print(arguments)
print(length(arguments))


# For more powerful arguments retrieving.
# use the package 

"
This is the first command line script.

Usage: 15-command-line-script.R 

" -> doc
library(docopt)
my_opt <- docopt(doc)
print(my_opt)
print(length(my_opt))