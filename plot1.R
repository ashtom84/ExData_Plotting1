plot1 <- function(path = 'household_power_consumption.txt'){
  # Reading the file
  test <- read.csv(path, sep = ';')
  test$Date <- as.Date(test$Date, format = '%d/%m/%Y')
  testFeb1 <- subset(test, Date == '2007-02-01')
  testFeb2 <- subset(test, Date == '2007-02-02')
  testFeb <- rbind(testFeb1, testFeb2)
  # Global Active power on Feb 1-2
  gaFeb <- as.numeric(as.character(testFeb$Global_active_power))
  # Saving and setting the plot
  png('plot1.png', 480, 480)
  hist(gaFeb,
       xlab = 'Global Active Power (kilowatts)',
       col = 'red',
       main = 'Global Active Power')
  dev.off()
}
