
# 
# install.packages("httr")
# install.packages("jsonlite")


# Introduction ------------------------------------------------------------
"
Many websites provide information through (API).
1) auth: APIs can be free or paid, some requires authentications and others are open without auth.
2) format: Most of these apis return the data in 'JSON' format.
"

# What is JSON ------------------------------------------------------------
"
primitive data types: string, number, boolean, null
complex data types: Object, Array
check: https://documentation.progress.com/output/ua/OpenEdge_latest/index.html#page/dvjsn/json-data-types.html
"

j.string <- '"Some text here"'
j.array.s <-  '["Jeddah", "Riyadh", "Makkah"]' # Array
j.array.m <-  '["Jeddah", 10, true]' # Array (mix data types)

j.object <-  '{"name": "Hamoud", "age": 32, "job": "student"}' # Object
j.array.of.objects <-  '[{}, {}, {}]' # Array of empty objects 

j.students.array <- '[
                      {"name": "Mike", "gender": "Male", "age": 35, "present": true},
                      {"name": "Sara", "gender": "Female", "age": 32, "present": true},
                      {"name": "John", "gender": "Male", "age": 25, "present": false},
                      {"name": "Nancy", "gender": "Female", "age": 40, "present": true},
                      {"name": "Cali", "gender": "Female", "age": 29, "present": false}
                    ]'

j.array.in.object <- '{
                          "name": "Hamoud",
                          "age": 32,
                          "courses": [
                            {"title": "php", "completed": "2014-08-04T10:23:32 +07:00"},
                            {"title": "MySql", "completed": "2015-01-04T10:11:32 +07:00"}
                          ],
                          "address": "18 King Road.",
                          "hoppies": ["Swimming", "Boxing", "Shopping"]
                        }'


# Convert JSON to R object. -----------------------------------------------

library(jsonlite)
# jsonlite::fromJSON()


r.string <- fromJSON(j.string)
str(r.string)

r.array.s <- fromJSON(j.array.s)
str(r.array.s)

r.array.m <- fromJSON(j.array.m)
str(r.array.m)

r.object <- fromJSON(j.object)
str(r.object)

r.array.of.objects <- fromJSON(j.array.of.objects)
str(r.array.of.objects)

r.students.array <- fromJSON(j.students.array)
str(r.students.array)

r.array.in.object <- fromJSON(j.array.in.object)
str(r.array.in.object)

# jsonlite::toJSON()
toJSON(mtcars)




# Get JSON from API -------------------------------------------------------

# base_uri
# endpoint
# parameters (query string)

hadley_orgs <- fromJSON("https://api.github.com/users/hadley/orgs")
hadley_repos <- fromJSON("https://api.github.com/users/hadley/repos")
hadley_repos.7 <- fromJSON("https://api.github.com/users/hadley/repos?page=7")
gg_commits <- fromJSON("https://api.github.com/repos/hadley/ggplot2/commits")
gg_issues <- fromJSON("https://api.github.com/repos/hadley/ggplot2/issues")

#latest issues
paste(format(gg_issues$user$login), ":", gg_issues$title)

# Authentication ----------------------------------------------------------
library(httr)


hadley_orgs_httr <- fromJSON("https://api.github.com/users/hadley/orgs")




# Resources ---------------------------------------------------------------

links <-
  c(
    "https://www.programmableweb.com/news/how-to-access-any-restful-api-using-r-language/how-to/2017/07/21",
    "https://cran.r-project.org/web/packages/jsonlite/vignettes/json-apis.html",
    "https://cran.r-project.org/web/packages/httr/vignettes/api-packages.html",
    "https://www.json-generator.com/"
  )
