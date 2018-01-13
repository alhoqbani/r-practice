# Errors Handling

# sqrt('any string')
# print('will this line be executed?')
"
sqrt('any string') will throw an error.
if you run the above two lines, both will run. Error will not stop the script.
Becuase R will run each line separately.
However, if source the whole file. The script will stop at the first error.
"


# Try
"
When we have error inside the try(), the execution will continue.
"

# try(sqrt('any string'))
# print('will this line be executed?')

failure <- try(sqrt('any string'), silent = T)
print('will this line be executed?')
class(failure)

# Return value from try()
success <- try(sqrt(4))


# tryCatch

tryCatch(
  {
    # Your code here
    1 + 1
    sqrt(4)
    sqrt('1')
    wanring('no more')
    stop('run away')
  },
  error = function (e) e, # try: print('some error'); str(e); print(e$message)
  warning = function(e) e,
  message = function(e) e,
  interrupt = function(e) e,
  finally = print('This will be printed no matter what')
)

