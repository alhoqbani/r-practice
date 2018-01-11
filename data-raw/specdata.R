
spec.file <- list.files('data-raw/specdata/', full.names = T)

specdata.data <- data.frame()

for(file in spec.file) {
  file.data <- read.csv(file)
  specdata.data <- rbind(specdata.data, file.data)
}


save(specdata.data, file = 'data/specdata.data.rda')
