#



opt <- function(k, items) {
  current.item <- 1
  w <- items[current.item, 'w']
  v <- items[current.item, 'v']
  
  if (w < 9) {
    
  }
  
  print(c(w, v))
}


opt(9, items) # 5


items <- data.frame(
  w = c(4, 5, 2),
  v = c(5, 6, 3)
)

