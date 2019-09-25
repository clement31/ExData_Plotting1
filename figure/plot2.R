
##### Assignement "Explanatory Data Analysis (Week 1) 


############## Open File ###################

Data <- read.table("C:/Users/clement.bely/Documents/R/Coursera/Devoirs/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
head(Data)

## Format date to Type Date
Data$Date <- as.Date(Data$Date, "%d/%m/%Y")


## Filter data set from Feb. 1, 2007 to Feb. 2, 2007
Data <- subset(Data,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))


## Remove incomplete observation
Data <- Data[complete.cases(Data),]
head(t)

## Combine Date and Time column
dateTime <- paste(Data$Date, Data$Time)

## Name the vector
dateTime <- setNames(dateTime, "DateTime")

## Remove Date and Time column
Data <- Data[ ,!(names(Data) %in% c("Date","Time"))]

## Add DateTime column
Data <- cbind(dateTime, Data)

## Format dateTime Column
Data$dateTime <- as.POSIXct(dateTime)







## Create Plot 2

par(mfrow=c(1,1))
plot(Data$Global_active_power~Data$dateTime, xlab="", ylab ="Global Active Power (kilowatts)", type="l")

## Save file and close device

dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()