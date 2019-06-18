data <- read.table('household_power_consumption.txt', sep = ';', header = TRUE,
                   na.strings = '?')#reading the dataset

data$Date <- as.Date(data$Date, "%d/%m/%Y")# converting the date into date format
data_new <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

data_new$DateTime <- as.POSIXct(paste(as.Date(data_new$Date), data_new$Time))

png('plot3.png', width = 480, height = 480)#setting the device to be png

plot(data_new$Sub_metering_1~data_new$DateTime, type = 'l', xlab='',
     ylab = 'Energry Sub Metering')
lines(data_new$Sub_metering_2~data_new$DateTime, type = 'l', col = 'red')
lines(data_new$Sub_metering_3~data_new$DateTime, type = 'l', col = 'blue')
legend("topright", col=c("black", "red", "blue"),lty = 1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off() #saving the plot
