

##Reading in data; large dataset -> add some information to save time and memory /// Rf. "Reading and writing data Part I" in "R Programming"

data <- read.table("./Exploratory_analysis/household_power_consumption.txt", header=T, nrows=2075259, sep= ";", colClasses=c("character", "character", rep("numeric", 7)), na.strings="?")

dim(data)


###subset data  /// "Subsetting and sorting" in "Getting and cleaning data"

subset_data <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")



##Making a Variable "Date plus Time" /// Rf. "Working with Dates" in "Getting and cleaning data" AND "Editing text variables" in "Getting and cleaning data"

subset_data$DateTime <- paste(subset_data$Date, subset_data$Time) 
subset_data$DateTime <- strptime(subset_data$DateTime, "%d/%m/%Y %H:%M:%S")

class(subset_data$DateTime)
head(subset_data$DateTime)


##Making plot 2

png(file = "plot2.png", width=480, height=480, units="px")
plot(subset_data$DateTime, subset_data$Global_active_power, type="l", xlab=" ", ylab= "Global Active Power(kilowatts)")
dev.off()