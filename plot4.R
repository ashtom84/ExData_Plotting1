plot4 <- function(path = pathMac) {
  # Reading the file
  test <- read.csv(path, sep = ';')
  test$Date <- as.Date(test$Date, format = '%d/%m/%Y')
  testFeb1 <- subset(test, Date == '2007-02-01')
  testFeb2 <- subset(test, Date == '2007-02-02')
  testFeb <- rbind(testFeb1, testFeb2)
  # Definitions for the First plot
  gaFeb <- as.numeric(as.character(testFeb$Global_active_power))
  # Definitions for the Second plot
  voltFeb <- as.numeric(as.character(testFeb$Voltage))
  # Definitions for the Third plot
  SM1 <- as.numeric(as.character(testFeb$Sub_metering_1))
  SM2 <- as.numeric(as.character(testFeb$Sub_metering_2))
  SM3 <- as.numeric(as.character(testFeb$Sub_metering_3))
  SubMet <- data.frame(Sub_metering_1 = SM1,
                       Sub_metering_2 = SM2,
                       Sub_metering_3 = SM3)
  # Definitions for the fourth plot, similar to the Second one
  grpFeb <- as.numeric(as.character(testFeb$Global_reactive_power))
  # Saving the plot as a .png file
  png('plot4.png', 480, 480)
  # Setting the 2*2 size of the plot
  par(mfrow = c(2, 2))
  # First plot, same as plot2
  plot(gaFeb,
       xaxt = 'n',
       type = 'l',
       xlab = '',
       ylab = 'Global Active Power (kilowatts)')
  axis(1, at = c(1, 1440, 2880), labels = c('Thu', 'Fri', 'Sat'))
  # Second plot
  plot(voltFeb,
       xaxt = 'n',
       type = 'l',
       xlab = 'datetime',
       ylab = 'Voltage')
  axis(1, at = c(1, 1440, 2880), labels = c('Thu', 'Fri', 'Sat'))
  # Third plot, same as plot3
  with(SubMet, plot(SubMet$Sub_metering_1,              
                    xaxt = 'n',
                    type = 'l',
                    xlab = '',
                    ylab = 'Energy sub metering'))
  
  with(SubMet, points(SubMet$Sub_metering_2, type = 'l',
                      col = 'red'))
  legend(x = 1200, y = 38, c('Sub_metering_1', 'Sub_metering_2',
                       'Sub_metering_3'),
         lty = 1, col = c('black', 'red', 'blue'), lwd = 1,
         bty = 'n', cex = 0.85, y.intersp = 1, seg.len = 1)
  with(SubMet, points(SubMet$Sub_metering_3, type = 'l',
                      col = 'blue'))
  
  axis(1, at = c(1, 1440, 2880), labels = c('Thu', 'Fri', 'Sat'))
  # Fourth plot
  plot(grpFeb,
       xaxt = 'n',
       type = 'l',
       xlab = 'datetime',
       ylab = 'Global_reactive_power')
  axis(1, at = c(1, 1440, 2880), labels = c('Thu', 'Fri', 'Sat'))
  # closing the png device¨
  dev.off()
}
