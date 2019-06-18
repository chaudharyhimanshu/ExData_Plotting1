data <- read.table('household_power_consumption.txt', sep = ';', header = TRUE,
                   na.strings = '?')#reading the dataset

data$Date <- as.Date(data$Date, "%d/%m/%Y")# converting the date into date format
data_new <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

data_new$DateTime <- as.POSIXct(paste(as.Date(data_new$Date), data_new$Time))

png('plot4.png', width = 480, height = 480)#setting the device to be png

par(mfrow = c(2,2)) #setting number of plot to 4

plot(data_new$Global_active_power~data_new$DateTime,type = 'l',
     xlab = '',ylab = 'Global Active Power(killowatts)')

with(data_new,plot(Voltage~DateTime, type = 'l'))

plot(data_new$Sub_metering_1~data_new$DateTime, type = 'l', xlab='',
     ylab = 'Energry Sub Metering')
lines(data_new$Sub_metering_2~data_new$DateTime, type = 'l', col = 'red')
lines(data_new$Sub_metering_3~data_new$DateTime, type = 'l', col = 'blue')
legend("topright", col=c("black", "red", "blue"),lty = 1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(data_new,plot(Global_reactive_power~DateTime,type = 'l'))

dev.off() #saving the plot
     