library(DBI)
help(package = DBI)

# Connect to my-db as defined in ~/.my.cnf
con <- dbConnect(
  RMySQL::MySQL(),
  user = 'root',
  password = ''
)

# Database info
dbGetInfo(con)
# List of tables from database
dbListTables(con)
# Write the data.frame to new table
dbWriteTable(con, "mtcars", mtcars, overwrite = T)
dbListTables(con)
# Fields for a specific table
dbListFields(con, "sa_regions")
# Import complete table
dbReadTable(con, "sa_regions")
# Check data type
dbDataType(RMySQL::MySQL(), 1:10)

# Import rows
class(dbGetQuery(con, 'SELECT * FROM mtcars LIMIT 1'))

# You can fetch all results: (Two Steps)
query <- dbSendQuery(con, "SELECT * FROM mtcars WHERE cyl = 4")
dbFetch(query)
dbClearResult(res)

# Or a chunk at a time
res <- dbSendQuery(con, "SELECT * FROM mtcars WHERE cyl = 4")
while (!dbHasCompleted(res)) {
  chunk <- dbFetch(res, n = 5)
  print(nrow(chunk))
}

# Get the sql query
dbGetStatement(res)
# Get query/result information
dbGetInfo(res)

# Clear the result
dbClearResult(res)

# Disconnect from the database
dbDisconnect(con)


con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbListTables(con)
dbWriteTable(con, 'mtcars', mtcars, overwrite = TRUE)
dbWriteTable(con, 'students', students)
dbListTables(con)
dbExistsTable(con, 'mtcars')
dbExecute(con, 'DELETE FROM mtcars')
dbReadTable(con, 'students')
