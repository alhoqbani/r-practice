# MoneyBall Project


batting <- read.csv('practice-project/MoneyBall/data-raw/batting.csv')

# head(batting)
# str(batting)
# names(batting)
# head(batting$AB)
# head(batting$X2B)



# Add new variables -------------------------------------------------------

# Batting Average (BA).
batting$BA <- batting$H / batting$AB


# Creating X1B (Singles)
batting$X1B <- batting$H - batting$X2B - batting$X3B - batting$HR

# On Base Percentage (OBP).
batting$OBP <- 
  (batting$H + batting$BB + batting$HBP) / 
  (batting$AB + batting$BB + batting$HBP + batting$SF)


# Slugging Percentage (SLG).
batting$SLG <-
  ( batting$X1B + (2 * batting$X2B) + (3 * batting$X3B) + (4 * batting$HR) ) /
  batting$AB
  

# str(batting)


# Salaries ----------------------------------------------------------------

salaries <- read.csv('practice-project/MoneyBall/data-raw/salaries.csv')

# summary(salaries)
# summary(batting)

# Get only batting that more than or equal 1985
batting <- batting[batting$yearID >= 1985 ,]

# summary(salaries$yearID)
# summary(batting$yearID)


# Merge batting with salaries

combo <- merge(batting, salaries, by = c('yearID', 'playerID'))
rm(batting, salaries)

# Get only the data for year 2001

combo <- combo[combo$yearID == 2001, ]

# Find and remove lost_players ------------------------------------------------------

lost_players_logic <- combo$playerID %in% c('giambja01' , 'damonjo01', 'saenzol01')

lost_players <-
  combo[lost_players_logic , c('playerID','H','X2B','X3B','HR','OBP','SLG','BA','AB')]


# Remove lost_players from the combo data frame
combo <- combo[ ! lost_players_logic, ]

rm(lost_players_logic)


# The Constraints ---------------------------------------------------------

combined_salary <- 15000000 / 1000000
combined_AB <- sum(lost_players$AB)
mean_OBP <- mean(lost_players$OBP)

# Get only the variables we need from comob
pool <- combo[ , c('yearID', 'playerID', 'AB', 'OBP', 'salary')]

# Convert salaries to be by million
pool$salary <- pool$salary / 1000000

# Sort the pool data fram
pool <- pool[order(pool$AB,  pool$OBP, pool$salary, decreasing = T),]

# Function to check if the selected combination will satisfy all constraints
check.option <- function(rows) {
  option <- pool[rows ,]
  list(
    option = option,
    salary = sum(option$salary) <= combined_salary,
    AB = sum(option$AB) >= combined_AB,
    OBP = mean(option$OBP) >= mean_OBP
  )
}

# Test the function with one combination
check.option(c(1, 7,3))



# Create data frame with possible combination from the first 10 players
possible.combinations <-
  expand.grid(player.1 = 1:20, # Test only the first 20 rows !!
              player.2 = 1:20,
              player.3 = 1:20)


# Remove options with duplicate players
selected.rows <- apply(possible.combinations, 1, function (row) {
  length(unique(row)) == 3
})

possible.combinations <- possible.combinations[selected.rows, ]
rm(selected.rows)

# Check all possible combinations against the constraints
result.list <- apply(possible.combinations, 1, check.option)

# Filter the result to get only the combinations taht satisfy the constraints
results <- lapply(result.list, function(x) {
  if (all(as.logical(x[2:4]))) {
    x
  }
})


# Get all passing combinations
results <- results[lapply(results, length) > 0]