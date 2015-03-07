plot2 <- function(path = pathMac) {
  # Reading the file
  test <- read.csv(path, sep = ';')
  test$Date <- as.Date(test$Date, format = '%d/%m/%Y')
  testFeb1 <- subset(test, Date == '2007-02-01')
  testFeb2 <- subset(test, Date == '2007-02-02')
  testFeb <- rbind(testFeb1, testFeb2)
  # Global Active power on Feb 1-2
  gaFeb <- as.numeric(as.character(testFeb$Global_active_power))
  # Saving and setting the plot
  png('plot2.png', 480, 480)
  plot(gaFeb,
       xaxt = 'n',
       type = 'l',
       xlab = '',
       ylab = 'Global Active Power (kilowatts)')
  axis(1, at = c(1, 1440, 2880), labels = c('Thu', 'Fri', 'Sat'))
  dev.off()
}
