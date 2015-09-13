## Programming assignment to create plots for assignment 1

## Load data from file
pwr_data <- read.csv("C:/Users/kyle/Desktop/Coursera/datasciencecoursera/exdata-data-household_power_consumption/household_power_consumption.txt", sep = ";", na.strings = "?")

#create a new column with a combined date time
dtime_str <- paste(pwr_data$Date, pwr_data$Time)
pwr_data$dtime <- strptime(dtime_str, format = "%d/%m/%Y %H:%M:%S")

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

## Remove na values

# open model to plot to file
png(filename = "plot3.png")

## generate plot and write to file
plot(pwr_data_cut$dtime, pwr_data_cut$Sub_metering_1, type="l", col="black", ylab = "", xlab="")
lines(pwr_data_cut$dtime, pwr_data_cut[, "Sub_metering_2"], col="red")
lines(pwr_data_cut$dtime, pwr_data_cut[, "Sub_metering_3"], col="blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)

title(ylab = "Energy sub metering" )

#close open device
dev.off()
