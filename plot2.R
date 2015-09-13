##Download and extract data from "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
##Place in working directory

hpc <- read.csv2("./household_power_consumption.txt", stringsAsFactors = F) ##Read in data from working directory

hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y") ##Coerce the dates into the data class Date

subhpc <- subset(hpc, hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02")  ##Only take the two relevant days

subhpc$datetime <- strptime(paste(subhpc$Date, subhpc$Time), format = "%Y-%m-%d %H:%M:%S")
##Merge Date and Time columns and coerce them into class type date (POSIXlt)

png(filename = "plot2.png") ##Create empty png file and place next graph in it

plot(subhpc$datetime, subhpc$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off() ##Finished with png file