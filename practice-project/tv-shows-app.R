# Api to work with: http://api.tvmaze.com/ 

base.uri <- 'http://api.tvmaze.com/'


# Get all shows from the api.
end.point <- 'shows'

url.empty <- paste0(base.uri, end.point, '?', 'page=', 13000)

df.url.empty <- fromJSON(url.empty)


# Endpoint 