data <- read.table('household_power_consumption.txt', sep = ';', header = TRUE,
                   na.strings = '?')#reading the dataset

data$Date <- as.Date(data$Date, "%d/%m/%Y")# converting the date into date format
data_new <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

data_new$DateTime <- as.POSIXct(paste(as.Date(data_new$Date), data_new$Time))

png('plot2.png', width = 480, height = 480)#setting the device to be png

plot(data_new$Global_active_power~data_new$DateTime,type = 'l',
     xlab = '',ylab = 'Global Active Power(killowatts)')

dev.off()#saving the plot