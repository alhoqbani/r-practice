
# What is environment -----------------------------------------------------

# Key value pair

x <- 1:10
y <- mtcars

f <- function () {
  print('hi')
}


env.1 <- new.env()
class(env.1)

env.1$a <- 'A Letter'
env.1$key <- 1:3

objects(env.1)
objects()
ls()
get('a', env.1)

get('f')


env.1$a

a

env.1$bool <- F

env.1$c <- 1:3

env.1$d <- env.1$c

env.1$some.object <- mtcars


names(env.1)

class(env.1) # environment

attributes(env.1) 
attr(env.1, 'name') <- 'my.first.env'

env.1$inner.env <- new.env()
env.1$inner.env

parent.env(env.1)
parent.env(environment())
parent.env(environment())
parent.env(environment(env.1$inner.env))

search()

"Everey environment has a parent except the empty environment"
parent.env(env.1)

baseenv()

rm('letters', envir = baseenv())

env.empty <- emptyenv()
parent.env(env.empty) # Error: the empty environment has no parent

search()

library(YazeedPackage)
library(rSaudiregions)
detach('package:YazeedPackage')


# Special Environment -----------------------------------------------------


# 1) Gloabl Env
globalenv()
parent.env(globalenv()) # The last package was loaded using library() or require()



library(rSaudiregions)
parent.env(globalenv()) # The last package was loaded using library() or require()
# detach('package:rSaudiregions')
search() # lists all parents of the global environment
as.environment("package:stats")

rm('tree', as.environment("package:dataset"))


# 2) Base Env
baseenv() # environment of the base package

# 3) Empty Env
emptyenv() # ultimate/last ancestor of all environments.

# 4) Current Environment
environment()




# Working with Environment ------------------------------------------------
# List env objects
ls(env.1)
ls(globalenv())
ls(globalenv(), all.names = T)
ls(baseenv())

# Structure of env, will include objects
str(env.1)
ls.str(env.1) # Will show also hidden objects (start with .)

# Get objects out of env
env.1$some.object
env.1[['some.object']]
get('some.object', envir = env.1)

env.1$any.object # Retrun null of obj does not exist
env.1[['any.object']] # Retrun null of obj does not exist
get('any.object', envir = env.1) # Return Error when objs does not exist

# Remove objects from env
rm('bool', envir = env.1)

rm(list = ls(env.1))

rm(list = ls())


exists("x", envir = env.1)
exists("a", envir = env.1)




fun.name <- function() {
  print(environment())
}



fun.name()


# Function environments ---------------------------------------------------

# Four types: enclosing, binding, execution, calling.

x <<- 1 # edit x in the parents envs, if x not found, x created in GlobalEnv

# Resources ---------------------------------------------------------------

"http://adv-r.had.co.nz/Environments.html"
