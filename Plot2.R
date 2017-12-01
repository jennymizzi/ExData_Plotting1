library(readr)
household_power_consumption <- read_delim("C:/Users/jenmi/Documents/RCoursera/ExploratoryDataAnalysis/Week1/Week1RFiles/household_power_consumption.txt", ";", escape_double = FALSE, trim_ws = TRUE)
myData<- household_power_consumption

myData[,"Date"]<- as.Date(myData$Date, "%d/%m/%Y") # convert to date

# subset data on date ranges 2007-02-01 and 2007-02-02
myData<- subset(myData, Date >= as.Date("2007-02-01"))
myData<- subset(myData, Date <= as.Date("2007-02-02"))

myData$CombinedDayTime<- as.POSIXct(paste(myData$Date, myData$Time)) #combine day and time for graphing

png(filename = "plot2.png", width = 480, height = 480, bg = "white") #open png file

with(myData, plot(CombinedDayTime,Global_active_power
                  , type = "l",
                  xlab = '',
                  ylab = "Global Active Power (killowatts)"))

dev.off()
