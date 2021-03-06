


##Reading in data; large dataset -> add some information to save time and memory /// Rf. "Reading and writing data Part I" in "R Programming"

data <- read.table("./Exploratory_analysis/household_power_consumption.txt", header=T, nrows=2075259, sep= ";", colClasses=c("character", "character", rep("numeric", 7)), na.strings="?")

dim(data)


###subset data  /// "Subsetting and sorting" in "Getting and cleaning data"

subset_data <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")




##Making plot 4 /// Rf. "The base plotting system in R" in "Exploratory Analysis"

png(file = "plot4.png",  width=480, height=480, units="px")
par(mfrow = c(2, 2))
with(subset_data, {
    plot(subset_data$DateTime, subset_data$Global_active_power, type="l", xlab=" ", ylab= "Global Active Power(kilowatts)")
    plot(subset_data$DateTime, subset_data$Voltage, type="l", xlab="datetime", ylab="Voltage")
    plot(subset_data$DateTime, subset_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    lines(subset_data$DateTime, subset_data$Sub_metering_2, type="l", col="red")
    lines(subset_data$DateTime, subset_data$Sub_metering_3, type="l", col="blue")
    legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1)
    plot(subset_data$DateTime, subset_data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
    dev.off() 
})