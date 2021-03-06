unzip("./exdata-data-household_power_consumption.zip")

data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";")

## Converts Date column to Date type
data <- transform(data, Date=as.Date(Date, "%d/%m/%Y"))

## filters only data we need
data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]


## Converts the rest of the columns to numeric
data <- transform(data, Global_active_power=as.numeric(as.character(Global_active_power)), Global_reactive_power=as.numeric(as.character(Global_reactive_power)), Voltage=as.numeric(as.character(Voltage)), Global_intensity=as.numeric(as.character(Global_intensity)), Sub_metering_1 = as.numeric(as.character(Sub_metering_1)), Sub_metering_2 = as.numeric(as.character(Sub_metering_2)), Sub_metering_3 = as.numeric(as.character(Sub_metering_3)))


## PLOT 1
png(filename='plot1.png', width=480, height=480, units='px')
par(mfcol=c(1,1))
hist(data$Global_active_power, col="Red", xlab="Global Acitve Power(killowatts)", ylab="Frequency", main="Global Active Power")
#dev.copy(png, file="plot1.png")
dev.off()