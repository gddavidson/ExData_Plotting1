# Read household_power_consumption.txt file, and produce four plots.  Plots are
# Global Acitve Power, Voltage, Energy Sub Metering, and Global Reactive Power
# for a two day period

hpc <- read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE)

# Create Date and POSIXlt class fields from Date and Time character strings 
hpc$DateAsDate <- as.Date(hpc$Date,format="%d/%m/%Y")
hpc$TimeAsTime <- strptime(hpc$Time,format="%H:%M:%S")

# Create a POSIXlt class DateTime stamp from the Date and Time fields 
hpc$DateTime <- strptime(paste(hpc$Date,hpc$Time),format="%d/%m/%Y %H:%M:%S")

# Create data frame containing a subset of the household_power_consumption for the
# dates 2007-02-01 and 2007-02-02
hpcsub <- hpc[hpc$DateAsDate == as.Date("2007-02-01") | hpc$DateAsDate == as.Date("2007-02-02"),]

# Select png device for plot output
png(file="ExData_Plotting1/plot4.png",width=480,height=480,bg = "transparent")

# Set area to hold four plots (2 rows and 2 columns)
par(mfrow=c(2,2))

# Generate Global Active Power plot
with(hpcsub,plot(DateTime,Global_active_power,
                 xlab="",
                 type="l",
                 ylab="Global Active Power(kilowatts)"))

# Generate Voltage plot
with(hpcsub,plot(DateTime,Voltage,
                 xlab="datetime",
                 type="l",
                 ylab="Voltage"))

# Generate Sub Metering plot
with(hpcsub, {
  plot(DateTime,Sub_metering_1,
       xlab="",
       type="l",
       col="black",
       ylab="Energy sub metering")
  lines(DateTime,Sub_metering_2,
        type="l",
        col="Red")
  lines(DateTime,Sub_metering_3,
        type="l",
        col="blue")
})

legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       text.col = c("black","red","blue"),
       lwd=1,
       col = c("black","red","blue"))

# Generate Global Reactive Power plot
with(hpcsub,plot(DateTime,Global_reactive_power,
                 xlab="datetime",
                 type="l"))


dev.off()
