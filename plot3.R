## plot3.R  -  David Ciocca

# Read data into R & subset for appropriate period.
dataFile <- "household_power_consumption.txt"
dataFull <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors = FALSE)
dataFull$Date <- as.Date(dataFull$Date, format = "%d/%m/%Y")
dataSub <- dataFull[(dataFull$Date =="2007-02-01") | (dataFull$Date == "2007-02-02") ,]

# Convert datetime
datetime <- paste(as.Date(dataSub$Date), dataSub$Time)
dataSub$dateTime <- as.POSIXct(datetime)

# Create numeric for Global_active_power column
gloabalActivePower <- as.numeric(dataSub$Global_active_power)

# Plot #3 data preprocessing
subMetering1 <- as.numeric(dataSub$Sub_metering_1)
subMetering2 <- as.numeric(dataSub$Sub_metering_2)
subMetering3 <- as.numeric(dataSub$Sub_metering_3)

# Plot #3 to the screen.

plot(dataSub$dateTime, subMetering1, type = "l", xlab = "", ylab = "Energy Submetering")
lines(dataSub$dateTime, subMetering2, type = "l", col = "red")
lines(dataSub$dateTime, subMetering3, type = "l", col = "blue")
legend("topright", c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), lty = 1,
       lwd = 2,col = c("black", "red", "blue"), cex = .65)

# Write png #3 file
dev.copy(png, file='plot3.png', height=480, width=480)
dev.off()
