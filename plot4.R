## plot4.R  -  David Ciocca

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

# Plot #4 data preprocessing
subMetering1 <- as.numeric(dataSub$Sub_metering_1)
subMetering2 <- as.numeric(dataSub$Sub_metering_2)
subMetering3 <- as.numeric(dataSub$Sub_metering_3)
voltage <- as.numeric(dataSub$Voltage)
globalReactivePower <- as.numeric((dataSub$Global_reactive_power))

# Plot #4 to the screen.
par(mfrow = c(2, 2))
plot(dataSub$dateTime, gloabalActivePower, type = "l", xlab = "", 
     ylab = "Global Active Power")

plot(dataSub$dateTime, voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(dataSub$dateTime, subMetering1, type = "l", xlab = "", ylab = "Energy Submetering")
lines(dataSub$dateTime, subMetering2, type = "l", col = "red")
lines(dataSub$dateTime, subMetering3, type = "l", col = "blue")
legend("topright", c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), lty = 1,
       lwd = 2,col = c("black", "red", "blue"), cex = .65)

plot(dataSub$dateTime, globalReactivePower, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power")

# Write png #4 file
dev.copy(png, file='plot4.png', height=480, width=480)
dev.off()