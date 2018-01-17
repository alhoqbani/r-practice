# install.packages("httr")
library(httr)
help(package = 'httr')

# Making Get Requests -------------------------------------------------------

http.response <- GET('http://httpbin.org/get')

# Inspect The Respone Object
class(http.response) # response (httr class)

str(http.response) # List of 10
names(http.response)

# What is the status code ?
http.response$status_code
http.response[['status_code']]
status_code(http.response)
# More details: 
http_status(http.response)

# Prepare for errors:
http.response <- GET('http://httpbin.org/status/400') # Bad Request
warn_for_status(http.response)
stop_for_status(http.response)


# The Body ----------------------------------------------------------------


?content

http.response <- GET('http://httpbin.org/get')

content(http.response, 'parsed')


# Authentication ----------------------------------------------------------






# Resources ---------------------------------------------------------------

links <-
  c(
    "https://cran.r-project.org/web/packages/httr/vignettes/quickstart.html",
    "https://www.programmableweb.com/news/how-to-access-any-restful-api-using-r-language/how-to/2017/07/21",
    "https://cran.r-project.org/web/packages/httr/vignettes/api-packages.html",
    "https://www.json-generator.com/"
  )
