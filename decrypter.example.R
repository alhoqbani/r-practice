# Decreyption to data
process.data <- function(dec) {
  
  print(dec)
  print(body(dec))
  # Get the data from files/api/net
  # Clean the data 
  # Find some value (secret)
  
  
  secret <- 1400
  
  key <- dec(secret)

  # Complete process and get the data
  
  data <- paste(key, 'some secret data')
  data
}

decrypter <- function(sec) {
  sec + 1
}


process.data(function(sec) {
  sec + 30492840928390
})




(function() {
  print('i am anyonmous')
})

