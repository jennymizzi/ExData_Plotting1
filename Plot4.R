library(readr)
household_power_consumption <- read_delim("C:/Users/jenmi/Documents/RCoursera/ExploratoryDataAnalysis/Week1/Week1RFiles/household_power_consumption.txt", ";", escape_double = FALSE, trim_ws = TRUE)
myData<- household_power_consumption

myData[,"Date"]<- as.Date(myData$Date, "%d/%m/%Y") # convert to date

# subset data on date ranges 2007-02-01 and 2007-02-02
myData<- subset(myData, Date >= as.Date("2007-02-01"))
myData<- subset(myData, Date <= as.Date("2007-02-02"))

myData$CombinedDayTime<- as.POSIXct(paste(myData$Date, myData$Time)) #combine day and time for graphing

png(filename = "plot4.png", width = 480, height = 480, bg = "white") #open png file

par(mfrow = c(2,2)) #set area for 4 plots

#plot 1 - GlobalAcitvePower
with(myData, plot(CombinedDayTime,Global_active_power
                  , type = "l",
                  xlab = '',
                  ylab = "Global Active Power"))

#plot 2 - Voltage
with(myData, plot(CombinedDayTime,Voltage
                  , type = "l",
                  xlab = "datetime",
                  ylab = "Voltage"))

#plot 3 - Energy sub metering
#make initial plot and plot Sub_metering_1
with(myData, plot(CombinedDayTime,Sub_metering_1
                  , type = "l",
                  xlab = '',
                  ylab = "Energy sub metering"))

#add lines for Sub_metering2&3
with(myData, points(CombinedDayTime,Sub_metering_2, type = "l", col = "red"))
with(myData, points(CombinedDayTime,Sub_metering_3, type = "l", col = "blue"))

#add legend
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))

#plot 4 - Global Reactive Power
with(myData, plot(CombinedDayTime,Global_reactive_power
                  , type = "l",
                  xlab = "datetime",
                  ylab = "Global_reactive_power"))

dev.off() # close file



