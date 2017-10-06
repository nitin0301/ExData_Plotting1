# Reading the data
df <- read.table("./household_power_consumption.txt",sep=";",header = TRUE)
df$Date <- strptime(df$Date,format="%d/%m/%Y")
df$Time <- format(strptime(df$Time,format="%H:%M:%S"),"%H:%M:%S")

# Subsetting Data
dfSmall <- subset(df,Date == "2007-02-01" | Date == "2007-02-02")

# Splitting the Graphing Area
par(mfcol=c(2,2))
par(bg=NA)

# PLOT 1
y <- as.numeric(as.character(dfSmall$Global_active_power))

# Plotting
plot(y,type="l",labels=FALSE,xlab=NA,ylab=NA,xaxt="n")
axis(1,at = c(0,1500,2880), labels = c("Thu","Fri","Sat"))
axis(2,at = c(0,2,4,6))
title(ylab = "Global Active Power")
#



# PLOT 2
y1 <- as.numeric(as.character(dfSmall$Sub_metering_1))
y2 <- as.numeric(as.character(dfSmall$Sub_metering_2))
y3 <- dfSmall$Sub_metering_3

# Plotting
plot(y1,type="l",labels=FALSE,xlab=NA,ylab=NA,xaxt="n",col="black")
points(y2,type="l",labels=FALSE,xlab=NA,ylab=NA,xaxt="n",col="red")
points(y3,type="l",labels=FALSE,xlab=NA,ylab=NA,xaxt="n",col="blue")
axis(1,at = c(0,1500,2880), labels = c("Thu","Fri","Sat"))
axis(2,at = c(0,10,20,30))
title(ylab = "Energy sub metering")
legend("topright",
       lty=c(1,1,1),
       pch=c(NA,NA,NA),
       col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#


# PLOT 3
y3 <- as.numeric(as.character(dfSmall$Voltage))

# Plotting
plot(y3,type="l",labels=FALSE,xlab=NA,ylab=NA,xaxt="n")
axis(1,at = c(0,1500,2880), labels = c("Thu","Fri","Sat"))
axis(2,at = c(234,238,242,246))
title(xlab="datetime",ylab = "Voltage")
#


# PLOT 4
y4 <- as.numeric(as.character(dfSmall$Global_reactive_power))

# Plotting
plot(y4,type="l",labels=FALSE,xlab=NA,ylab=NA,xaxt="n")
axis(1,at = c(0,1500,2880), labels = c("Thu","Fri","Sat"))
axis(2,at = c(0.0,0.1,0.2,0.3,0.4,0.5))
title(xlab="datetime",ylab = "Global_reactive_power")
#


# Copying the histogram plot from screen to png graphic device 
dev.copy(png,file="plot4.png",width=480,height=480,pointsize=8)
dev.off()

