## Programming assignment to create plots for assignment 1

## Load data from file
pwr_data <- read.csv("C:/Users/kyle/Desktop/Coursera/datasciencecoursera/exdata-data-household_power_consumption/household_power_consumption.txt", sep = ";", na.strings = "?")

#convert date string to date class
pwr_data[,"Date"] <- as.Date(pwr_data[,"Date"], format = "%d/%m/%Y")


#convert time string to time class
# the created object also includes a date and time zone
# not sure what would happen if script was run at mignight when the date changes
# have to come back to specify time more precisely
#pwr_data[,"Time"] <- strptime(pwr_data[,"Time"], format = "%H:%M:%S")

## Filter data for appropriate dates
start_date <- as.Date("2007-02-01")
end_date <-  as.Date("2007-02-02")
pwr_data_cut <- pwr_data[pwr_data$Date >= start_date & pwr_data$Date <= end_date,]

# open model to plot to file
png(filename = "plot1.png")

## generate plot and write to file
hist(pwr_data_cut[, "Global_active_power"], col = "red", main = "", xlab = "", yaxp  = c(0, 1200, 6))
title(main = "Global Active Power", xlab = "Global Active Power (kilowatts)" )

#close open device
dev.off()
