unzip("./exdata-data-household_power_consumption.zip")

data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";")

## Converts Date column to Date type
data <- transform(data, Date=as.Date(Date, "%d/%m/%Y"))

## filters only data we need
data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]


## Converts the rest of the columns to numeric
data <- transform(data, Global_active_power=as.numeric(as.character(Global_active_power)), Global_reactive_power=as.numeric(as.character(Global_reactive_power)), Voltage=as.numeric(as.character(Voltage)), Global_intensity=as.numeric(as.character(Global_intensity)), Sub_metering_1 = as.numeric(as.character(Sub_metering_1)), Sub_metering_2 = as.numeric(as.character(Sub_metering_2)), Sub_metering_3 = as.numeric(as.character(Sub_metering_3)))



## PLOT 2
par(mfcol=c(1,1))

with(data, plot(strptime(paste(Date, Time), "%Y-%m-%d %H:%M"), Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab=""))
with(data, lines(strptime(paste(Date, Time), "%Y-%m-%d %H:%M"), Global_active_power))
dev.copy(png, file="plot2.png")
dev.off()