install.packages("pryr")




# Get all functions in the base package
objs <- mget(ls("package:base"), inherits = TRUE)


funs.primitive <- Filter(is.primitive, objs)

funs <- Filter(is.function, objs)

class(funs)

f <- function() x
x <- 15
f()
codetools::findFuncLocals(f)

environment(f) <- emptyenv()
f()
class(`+`)

class(`$`)



`(` <- function(e1) {
  if (is.numeric(e1)) {
    e1 + 1
  } else {
    e1
  }
}
replicate(50, (1 + 2))

rm('(')



myyyy <- function (name, dd = NULL) {
  if (is.null(dd)) {
    print('is null')
    print(name)
    print(dd)
  } else {
    print('not null')
    print(dd)
    print(name)
  }
}
myyyy('hamoud')





