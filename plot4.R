# Script for Coursera Exploratory Data Analysis Course Project 1
# Generating plots from the “Individual household electric power consumption Data Set”

# Define function to read data from file
read_file<- function(){
    # read file into data frame
    data<-read.csv("household_power_consumption.txt",sep=";",na.strings="?")
}

# Define function to subset and clean data
cleanup_data<- function(data){
    # subset out the required days
    data<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
    # convert Date and Time columns into Posix data type
    data$datetime<-strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
    data
}

# Define function to open PNG file
open_png_file<- function(filename){
    # open device of correct type and size, using filename variable passed as argument
    png(width = 480, height = 480, filename = filename)
    # make background transparent
    par(bg="transparent")
}

# Execute code to generate Plot 4

# read and clean up data
data<-read_file()
data<-cleanup_data(data)

# open png device
open_png_file("plot4.png")

# make plots
par(mfrow = c(2, 2))
with(data,{
    plot(datetime,Global_active_power,xlab = "", ylab = "Global Active Power",type = "l")
    plot(datetime,Voltage,type = "l")
    plot(datetime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
    points(datetime,Sub_metering_2,type="l",col="red")
    points(datetime,Sub_metering_3,type="l",col="blue")
    legend("topright",bty="n",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    plot(datetime,Global_reactive_power,type = "l")
})

# close device
dev.off()
