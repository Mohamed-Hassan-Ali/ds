plot2<-function (){

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


png(file="plot2.png", width=480,height=480)

with(feb,plot(feb$Time,feb$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))

dev.off()
}
