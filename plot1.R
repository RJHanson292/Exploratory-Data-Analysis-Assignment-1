##Download and extract data from "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
##Place in working directory

hpc <- read.csv2("./household_power_consumption.txt", stringsAsFactors = F) ##Read in data from working directory

hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y") ##Coerce the dates into the data class Date

subhpc <- subset(hpc, hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02")  ##Only take the two relevant days

png(filename = "plot1.png") ##Create empty png file and place next graph in it

hist(as.numeric(subhpc$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off() ##Finished with png file