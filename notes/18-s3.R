

# Source 1: Cyclismo ------------------------------------------------------


# source: http://cyclismo.org/tutorial/R/s3Classes.html


# * * Basic S3: UseMethod -------------------------------------------------


# Create a list
bubba <- list(first = "one",
              second = "two",
              third = "third")


# Append the list a new class
class(bubba) <- append(class(bubba), "Flamboyancy")


bubba # Notice: attr(,"class"): "list" "Flamboyancy"

# Now bubba object has two classes, list and our newly created class 'Flamboyancy'

#1 define a method for a class using: UseMethod()

? UseMethod

# We want to add a method 'GetFirst()' to the class Flamboyancy
# 1- Create a generic function, it will pass the object to UseMethod
GetFirst <- function(x)
{
  UseMethod("GetFirst", x)
  # When GetFirst passed an object, use the method implementation of that object class
}

# Testing the function to our object will give an error, cause no function is defined
# for the class Flamboyancy
GetFirst(bubba)

# Add the implementation of the method GetFirst to the class Flamboyancy
# by appending the class name to the function name: func.class
# This will add method GetFirst to the class Flamboyancy
GetFirst.Flamboyancy <- function(x)
{
  return(x$first)
}
# Now when we pass the any object has the class 'Flamboyancy', the above implementation
# Will be triggered
GetFirst(bubba)



# * * Memory management ---------------------------------------------------
"An environment can be thought of as a local scope. It has a set of variables associated with it. You can access those variables if you have the “ID’’ associated with the environment."

ls() # List of objects in env
e <- environment() # Current environment
e

# Use assign to create a variable in specific env
assign("bubba", 3, e)
# similar ?
e$cubba <- 2

get('bubba', e)
e$bubba

help(environment)



# * * Creating S3 Classes -------------------------------------------------

# Two ways: straightforward (using lists), and local environment

# * * * 1) straight-forward-approach ----

# You define a function that return a list and append the class name to the list.
# The list will have the methods and proporties of the class.
# Then, you create/instantiate an object fromfrom this class by calling the function.

# Define the function/class. (This is similar to javascript)
NorthAmerican <-
  function(eatsBreakfast = T,
           myFavorite = 'cereal') {
    # create a list with passed args
    my <- list(eatsBreakfast = eatsBreakfast,
               myFavorite = myFavorite)
    
    # Add the class name
    class(my) <-
      append(class(my), 'NorthAmerican') # NorthAmerican name of the class
    
    return(my)
  }
# Create object from the class:
bubba <- NorthAmerican()
class(bubba) #  "list" "NorthAmerican"

# It's just a list pre-puplolated with data.
bubba$eatsBreakfast
bubba$myFavorite

# Another object with diffirent values/proprties
louise <-
  NorthAmerican(eatsBreakfast = TRUE, myFavorite = "fried eggs")
louise$myFavorite



# * * * 2) local-environment-approach ----

# You create a function that return a list. The list uses the environment of the function
# to get and set the proprties of the object

NotAmerican <- function (eatsBreakfast = T,
                         myFavorite = "cereal") {
  # Get the current environment for this instance of the function
  # Remember (fresh start), every call to a function has its own env
  thisEnv <- environment()
  
  # Assign the arguments to variables in the current env. But why?
  hasBreakfast <- eatsBreakfast
  favoriteBreakfast <- myFavorite
  
  
  # Create the list that will represent the object
  me <- list(
    # We add the function (parent) env to the list
    thisEnv = thisEnv,
    
    # We define the methods for the class here (and proprties?).
    
    getEnv = function() {
      return(get('thisEnv', thisEnv))
    }
  )
  
  # We add the above list to the class/func env
  assign('this', me, envir = thisEnv)
  
  
  # Add the class name
  class(me) <- append(class(me), 'NotAmerican')
  
  
  # Return the list
  return(me)
}
bubba <- NotAmerican()
# access the envoirment of the class
bubba$getEnv()
ls(bubba$getEnv())
# access proprties of from the class
get('hasBreakfast', envir = bubba$getEnv())
get('favoriteBreakfast', envir = bubba$getEnv())
get('myFavorite', envir = bubba$getEnv())

# One problem with this approache is 'it uses pointers'
# When make a copy of the object, you get a pointer to the same object
person.1 <- NotAmerican(myFavorite = 'banana')
get('favoriteBreakfast', person.1$getEnv()) # banana
person.2 <- person.1 # We copy the object here
# Change person 3 favoriteBreakfast to appl
assign('favoriteBreakfast', 'apple', person.2$getEnv())
# Both objects now will have apple as favoriteBreakfast
get('favoriteBreakfast', person.2$getEnv()) # apple
get('favoriteBreakfast', person.1$getEnv()) # apple



# * * Creating Methods ----------------------------------------------------


# * * 1) Straight Forward Approach ----

# Define a generic function
setHasBreakfast <- function(elObjecto, newValue) {
  print('Calling the base setHasBreakfast function')
  UseMethod('setHasBreakfast', elObjecto)
  print('Note this is not executed!')
}

# Define a defulat function to be used when called with other classes
setHasBreakfast.default <- function(elObjecto, newValue) {
  print('You screwed up. I do not know how to handle this object!')
  print(NULL)
}

# Define the NorthAmerica class implementation of the function (function.classname)
setHasBreakfast.NorthAmerican <- function(elObjeto, newValue) {
  print("In setHasBreakfast.NorthAmerican and setting the value")
  elObjeto$eatsBreakfast <- newValue
  return(elObjeto)
}

# Instantiate the class. (Create an object from the class NorthAmerica)
bubba <- NorthAmerican()
bubba$eatsBreakfast # Check the current value: TRUE

bubba <- setHasBreakfast(bubba, FALSE)
# a copy of bubba is passed. (no modify in place).

# Check the value again
bubba$eatsBreakfast # value: FALSE

# Test the default function when object of other class is passed to the function
setHasBreakfast(mtcars)


# Define the getter
getHasBreakfast <- function(elObjeto)
{
  print("Calling the base getHasBreakfast function")
  UseMethod("getHasBreakfast", elObjeto)
  print("Note this is not executed!")
}

getHasBreakfast.default <- function(elObjeto)
{
  print("You screwed up. I do not know how to handle this object.")
  return(NULL)
}


getHasBreakfast.NorthAmerican <- function(elObjeto)
{
  print("In getHasBreakfast.NorthAmerican and returning the value")
  return(elObjeto$eatsBreakfast)
}


# * * 2) Local Environment Approach ----

NotAmerican <- function(eatsBreakfast = T,
                        myFavorite = 'cerial') {
  # Get the envoirment of this class (this instance of the function/class)
  this.Env <- environment()
  
  # Assign passed args to the object property
  hasBreakfast <- eatsBreakfast
  favoriteBreakfast <- myFavorite
  
  # Create the list which represents the new object
  me <- list(
    # Grab the envoriment of the parent (the object env)
    this.Env = this.Env,
    
    # Define some functions/methods
    getEnv = function() {
      return(get('this.Env', this.Env))
    },
    
    # hasBreakfast setter and getter
    getHasBreakfast = function() {
      return(get('hasBreakfast', this.Env))
    },
    setHasBreakfast = function(newValue) {
      return(assign('hasBreakfast', newValue, envir = this.Env))
    },
    
    # favoriteBreakfast setter and getter
    getFavoriteBreakfast = function() {
      return(get('favoriteBreakfast', this.Env))
    },
    setFavoriteBreakfast = function(newValue) {
      return(assign('favoriteBreakfast', newValue, envir = this.Env))
    }
    
  )
  
  
  # Define the me object/list to this environment
  assign('this', me, envir = this.Env)
  
  # Set the name of the class
  class(me) <- append(class(me), 'NotAmerican')
  
  return(me)
  
}

bubba <- NotAmerican()
class(bubba)

bubba$getFavoriteBreakfast()
bubba$setFavoriteBreakfast('banana')
bubba$getFavoriteBreakfast()

# * * * Avoid copy objects issu
bubba <- NotAmerican()
another.bubba <- bubba

bubba$getFavoriteBreakfast()
another.bubba$getFavoriteBreakfast()
bubba$setFavoriteBreakfast('New Food For Bubba')
# The copied object will be the same object (by reference)
another.bubba$getFavoriteBreakfast()

# Solution to the porblem is by adding copy method to the class
makeCopy <- function(obj) {
  UseMethod('makeCopy', obj)
}
makeCopy.NotAmerican <- function(obj) {
  newObj <- NotAmerican(
    eatsBreakfast = obj$getHasBreakfast(),
    myFavorite = obj$getFavoriteBreakfast()
  )
  
  return(newObj)
  
}

bubba <- NotAmerican()
another.bubba <- makeCopy(bubba)

bubba$getFavoriteBreakfast()
another.bubba$getFavoriteBreakfast()
bubba$setFavoriteBreakfast('New Food For Bubba')
# The copied object will keep its props
another.bubba$getFavoriteBreakfast()
bubba$getFavoriteBreakfast()


# * * Inheritance ---------------------------------------------------------

# You define a new class which inherit from a parent class by adding the
# parent class to the list of classes

# The parent/super class of all the following classes
Person <- function(eatsBreakfast = T,
                   myFavorite = 'eggs') {
  this.Env <- environment()
  
  hasBreakfast <- eatsBreakfast
  favoriteBreakfast <- myFavorite
  
  me <- list(
    this.Env = this.Env,
    getHasBreakfast = function() {
      return(get('hasBreakfast', envir = this.Env))
    },
    getFavoriteBreakfast = function() {
      return(get('favoriteBreakfast', envir = this.Env))
    }
  )
  
  assign('this', me, envir = this.Env)
  
  
  # Set the name of the class
  class(me) <- append(class(me), 'Person')
  
  return(me)
  
}

AmericanPerson <-
  function(myFavorite = 'bacon',
           makeBreakfast = 'fried') {
    # Create instance of the parent class
    obj <- Person(eatsBreakfast = T, myFavorite = myFavorite)
    
    # Append the new class to the parent class
    class(obj) <- append(class(obj), 'AmericanPerson')
    
    # Add special things for this class? (did not work !!)
    # obj$makeBreakfast <- makeBreakfast
    # obj$getMakeBreakfast <- function() {
    #   return(get('makeBreakfast', envir = obj$getEnv()))
    # }
    
    return(obj)
    
  }

american.person <- AmericanPerson()
class(american.person)

# 
# getFavoriteBreakfast <- function(theObject)
# {
#   print("Calling the base getFavoriteBreakfast function")
#   UseMethod("getFavoriteBreakfast", theObject)
# }
# 
# getFavoriteBreakfast.default <- function(theObject)
# {
#   print(noquote(paste("Well, this class has no getFavoriteBreakfast func")))
#   return(theObject)
# }
# 
# getFavoriteBreakfast.AmericanPerson <- function(theObject)
# {
#   print('getFavoriteBreakfast.AmericanPerson is called')
#   return(theObject$getFavoriteBreakfast())
# }
# 
# # test getFavoriteBreakfast.AmericanPerson
# getFavoriteBreakfast(american.person)
# 

makeBreakfast <- function(theObject) {
  print("Calling the base makeBreakfast function")
  UseMethod("makeBreakfast", theObject)
}

makeBreakfast.default <- function(theObject) {
  print(noquote(paste("Well, this is awkward. Just make",
                      theObject$getFavoriteBreakfast())))
  return(NULL)
}

makeBreakfast.AmericanPerson <- function(theObject) {
  print(noquote(paste("American Breakfast",
                      theObject$getFavoriteBreakfast())))
  NextMethod("makeBreakfast",theObject)
  return(NULL)
}

makeBreakfast.Person <- function(theObject) {
  print('The parent implementation')
  NextMethod("makeBreakfast",theObject)
}

class(american.person)

makeBreakfast(american.person)


# Sources -----------------------------------------------------------------

links <- list('http://cyclismo.org/tutorial/R/s3Classes.html')
