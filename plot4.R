##Download and extract data from "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
##Place in working directory

hpc <- read.csv2("./household_power_consumption.txt", stringsAsFactors = F) ##Read in data from working directory

hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y") ##Coerce the dates into the data class Date

subhpc <- subset(hpc, hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02")  ##Only take the two relevant days

subhpc$datetime <- strptime(paste(subhpc$Date, subhpc$Time), format = "%Y-%m-%d %H:%M:%S")
##Merge Date and Time columns and coerce them into class type date (POSIXlt)

png(filename = "plot4.png") ##Create empty png file and place next graph in it

par(mfcol = c(2, 2))

plot(subhpc$datetime, subhpc$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)") ##replot the second graph in top left

plot(subhpc$datetime, subhpc$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(subhpc$datetime, subhpc$Sub_metering_2, type = "l", col = "red")
points(subhpc$datetime, subhpc$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 1)
##replot third graph in bottom left

plot(subhpc$datetime, subhpc$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
##Plot voltage in the style of the second plot top right

plot(subhpc$datetime, subhpc$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
##Plot Global reactive power in the style of the second plot bottom right

dev.off() ##Finished with png file