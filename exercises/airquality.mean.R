# Option 1 ----------------------------------------------------------------
df <- airquality
result <- data.frame()
months <- unique(df$Month)
for (month in months) {
  sub.data <- df[df$Month == month, ]
  
  month.row <- c(
    month,
    mean(sub.data[['Ozone']], na.rm = T),
    mean(sub.data[['Solar.R']], na.rm = T),
    mean(sub.data[['Wind']], na.rm = T),
    mean(sub.data[['Temp']], na.rm = T)
  )
  result <- rbind.data.frame(result, month.row)
}
colnames(result) <- c('Month', names(df)[1:4])
print(result)


# Option 2 ----------------------------------------------------------------

df <- airquality
result.2 <- data.frame()
months <- unique(df$Month)
for (month in months) {
  sub.data <- df[df$Month == month, ]
  result.2 <- rbind.data.frame(result.2, sapply(sub.data, mean, na.rm = T))
}
colnames(result.2) <- names(df)
print(result.2)




# Option 3 ----------------------------------------------------------------

split(df, df$Month)
result.2 <- data.frame()
for(sub.df in split(df, df$Month)) {
  result.2 <- rbind.data.frame(result.2, colMeans(sub.df, na.rm = T)[1:5])
}
colnames(result.2) <- c(names(df)[1:5])
result.2 <- result.2[, c(5, 1:4)]
print(result.2)



# Option 4 ----------------------------------------------------------------





