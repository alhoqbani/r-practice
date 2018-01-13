#!/usr/bin/env Rscript

# 

# Calculate BMI from weight in kg and height in centimeters ---------------

arguments <- commandArgs(trailingOnly = TRUE)

weight = as.numeric(strsplit(arguments[1], split = '=')[[c(1, 2)]])
height = as.numeric(strsplit(arguments[2], split = '=')[[c(1, 2)]])

paste0('Your Weight is ',
       weight,
       ' kg, and your height is ',
       height / 100,
       ' meters')

paste0("Your BMI is ", round(weight / (height / 100) ^ 2))

# Resource ----------------------------------------------------------------

Resource.links <-
  c(
    "http://extoxnet.orst.edu/faqs/dietcancer/web2/twohowto.html",
    "http://www.thecalculatorsite.com/articles/health/bmi-formula-for-bmi-calculations.php"
  )
