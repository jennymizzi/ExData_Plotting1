library(readr)
household_power_consumption <- read_delim("C:/Users/jenmi/Documents/RCoursera/ExploratoryDataAnalysis/Week1/Week1RFiles/household_power_consumption.txt", ";", escape_double = FALSE, trim_ws = TRUE)
myData<- household_power_consumption

myData[,"Date"]<- as.Date(myData$Date, "%d/%m/%Y") # convert to date

# subset data on date ranges 2007-02-01 and 2007-02-02
myData<- subset(myData, Date >= as.Date("2007-02-01"))
myData<- subset(myData, Date <= as.Date("2007-02-02"))


png(filename = "plot1.png", width = 480, height = 480, bg = "white") #open png file


hist(myData$Global_active_power,
    col = "red",
    main = "Global Active Power",
    xlab = "Global Active Power (kilowatts)") #create histogram

dev.off() # close png connection

