plot1<-function (){

##reading the data, and modfiying na.strings to "?"
data<-read.table("household_power_consumption.txt",sep=";",header=T,na.strings="?")

##removing missing values
good<-complete.cases(data)
data<-data[good,]

##converting date items into date objects
data$Date<-as.Date(data$Date,format= "%d/%m/%Y")

##taking a subset of date form  2007-02-01 to 2007-02-02
feb<-data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]

png(file="plot1.png", width=480,height=480)
hist(feb$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active power")
##end of fun

dev.off()
}
