plot3 <- function(path = 'household_power_consumption.txt') {
  # Reading the file
  test <- read.csv(path, sep = ';')
  test$Date <- as.Date(test$Date, format = '%d/%m/%Y')
  testFeb1 <- subset(test, Date == '2007-02-01')
  testFeb2 <- subset(test, Date == '2007-02-02')
  testFeb <- rbind(testFeb1, testFeb2)
  # Sub Metering Feb 1-2
  SM1 <- as.numeric(as.character(testFeb$Sub_metering_1))
  SM2 <- as.numeric(as.character(testFeb$Sub_metering_2))
  SM3 <- as.numeric(as.character(testFeb$Sub_metering_3))
  SubMet <- data.frame(Sub_metering_1 = SM1,
                       Sub_metering_2 = SM2,
                       Sub_metering_3 = SM3)
  # Saving and setting the plot
  png('plot3.png', 480, 480)
  with(SubMet, plot(SubMet$Sub_metering_1,              
                    xaxt = 'n',
                    type = 'l',
                    xlab = '',
                    ylab = 'Energy sub metering'))
  with(SubMet, points(SubMet$Sub_metering_2, type = 'l',
                      col = 'red'))
  legend('topright', names(SubMet),
         lty = 1, col = c('black', 'red', 'blue'), lwd = 1)
  with(SubMet, points(SubMet$Sub_metering_3, type = 'l',
                      col = 'blue'))
  axis(1, at = c(1, 1440, 2880), labels = c('Thu', 'Fri', 'Sat'))
  dev.off()
}
