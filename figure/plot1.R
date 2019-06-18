data <- read.table('household_power_consumption.txt', sep = ';',
                   header = TRUE)  #reading the dataset

data$Date <- as.Date(data$Date, "%d/%m/%Y")  #converting date to Date format
data_new <- subset(data, Date >='2007-02-01')
data_new <- subset(data_new, Date <= '2007-02-02')
png('plot1.png', width = 480, height = 480) #setting the davice to png
hist(as.numeric(data_new$Global_active_power), col = "red", main = "Global Active Power", 
     xlab = 'Global Active Power (killowatts)')
dev.off()  #saving the plot
