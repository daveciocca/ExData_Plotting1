## plot1.R  -  David Ciocca

# Read data into R & subset for appropriate period.
dataFile <- "household_power_consumption.txt"
dataFull <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors = FALSE)
dataFull$Date <- as.Date(dataFull$Date, format = "%d/%m/%Y")
dataSub <- dataFull[(dataFull$Date =="2007-02-01") | (dataFull$Date == "2007-02-02") ,]


#dataSub <- subset(dataFull, subset=(Date = "01/02/2007" | Date = "02/02/2007"))

# Create numeric for Global_active_power column
gloabalActivePower <- as.numeric(dataSub$Global_active_power)

# Plot #1 to the screen
hist(gloabalActivePower, main = "Global Active Power", xlab = 
             "Global Active Power (kilowatts)", col = "red")

# Write png #1 file
dev.copy(png, file='plot1.png', height=480, width=480)
dev.off()

