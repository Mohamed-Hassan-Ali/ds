plot4<-function (){

##reading the data, and modfiying na.strings to "?"
data<-read.table("household_power_consumption.txt",sep=";",header=T,na.strings="?")

##removing missing values
good<-complete.cases(data)
data<-data[good,]

##converting date items into date objects
data$Date<-as.Date(data$Date,format= "%d/%m/%Y")

##making a character vectors for dates and times then paste together
dates<-as.character(data$Date)
times<-as.character(data$Time)
full_times<-paste(dates,times)
##convert full_times to time class
full_times<-strptime(full_times,"%Y-%m-%d %H:%M:%S")

##set data$Time to be full_times
data$Time<-full_times
##taking a subset of date form  2007-02-01 to 2007-02-02
feb<-data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]


png(file="plot4.png", width=480,height=480)

par(mfrow = c(2, 2))


##plot2
with(feb,plot(feb$Time,feb$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
##second plot
plot(feb$Time,feb$Voltage,type="line",xlab="datetime",ylab="Voltage")
##plot3
plot(feb$Time,feb$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(feb$Time,feb$Sub_metering_2, type="l",col="blue")
lines(feb$Time,feb$Sub_metering_3, type="l",col="red")
legend("topright",legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),col=c("black","blue","red"),pch="___")
##4th plot
plot(feb$Time,feb$Global_reactive_power,type="l",xlab="",ylab="Global_reactive_power")

dev.off()
}
