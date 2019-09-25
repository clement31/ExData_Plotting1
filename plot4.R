
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







## Create Plot 4

par(mfcol=c(2,2))

plot(Data$Global_active_power~Data$dateTime, xlab="", ylab ="Global Active Power (kilowatts)", type="l")

plot(Data$Sub_metering_1~Data$dateTime, xlab="", ylab ="Energy Sub meteing", type="l")
points(Data$Sub_metering_2~Data$dateTime, xlab="", ylab ="Energy Sub meteing", type="l", col="red")
points(Data$Sub_metering_3~Data$dateTime, xlab="", ylab ="Energy Sub meteing", type="l", col="blue")
legend("topright", lty=c(1,1,1), col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(Data$Voltage~Data$dateTime, xlab="datetime", ylab ="Voltage", type="l")

plot(Data$Global_reactive_power~Data$dateTime, xlab="datetime", ylab ="Global_reactive_power", type="l")

## Save file and close device

dev.copy(png, file = "plot4.png", width=480, height=480)
dev.off()