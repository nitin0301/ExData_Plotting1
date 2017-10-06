# Reading the data
df <- read.table("./household_power_consumption.txt",sep=";",header = TRUE)
df$Date <- strptime(df$Date,format="%d/%m/%Y")
df$Time <- format(strptime(df$Time,format="%H:%M:%S"),"%H:%M:%S")

# Subsetting Data
dfSmall <- subset(df,Date == "2007-02-01" | Date == "2007-02-02")

#
y1 <- as.numeric(as.character(dfSmall$Sub_metering_1))
y2 <- as.numeric(as.character(dfSmall$Sub_metering_2))
y3 <- dfSmall$Sub_metering_3

# Plotting
par(bg=NA)
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

# Copying the histogram plot from screen to png graphic device 
dev.copy(png,file="plot3.png",width=480,height=480,pointsize=8)
dev.off()

