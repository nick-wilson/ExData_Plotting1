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
    # open device of correct type and size
    png(width = 480, height = 480, filename = filename)
    # make background transparent
    par(bg="transparent")
}

# Execute code to generate Plot 2

# read and clean up data
data<-read_file()
data<-cleanup_data(data)

# open png device
open_png_file("plot2.png")

# make plot
with(data,plot(datetime,Global_active_power,xlab = "", ylab = "Global Active Power (kilowatts)",type = "l"))

# close device
dev.off()
