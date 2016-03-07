## plot2.R  -  David Ciocca

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

# Plot #2 to the screen.
plot(dataSub$Global_active_power~dataSub$dateTime, type="l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")

# Write png #2 file
dev.copy(png, file='plot2.png', height=480, width=480)
dev.off()