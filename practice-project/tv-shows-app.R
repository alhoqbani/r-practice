library(jsonlite)
library(httr)
# Api to work with: http://api.tvmaze.com/ 

base.uri <- 'http://api.tvmaze.com/'


# Get all shows from the api.
end.point <- 'shows'

# Endpoint 



shows.listings <- list()

x <- try(fromJSON(paste0(base.uri, end.point, '?page=', 1)), silent = T)

if (class(x) == 'try-error') {
  break
}
shows.listings <- 


x[]
head(x, n = 1)

write.csv(x, file = '~/Desktop/shows.csv')
