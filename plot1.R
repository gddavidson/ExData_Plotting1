# Read household_power_consumption.txt file, and produce a Frequency Histogram
# for Global_active_power

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
png(file="plot1.png",width=480,height=480)

# Generate histogram
hist(as.numeric(hpcsub$Global_active_power),col="red",
     xlab="Global Active Power (kilowatts)",main="Global Active Power")

dev.off()
