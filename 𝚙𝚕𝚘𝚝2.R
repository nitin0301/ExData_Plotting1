# Reading the data
df <- read.table("./household_power_consumption.txt",sep=";",header = TRUE)
df$Date <- strptime(df$Date,format="%d/%m/%Y")
df$Time <- format(strptime(df$Time,format="%H:%M:%S"),"%H:%M:%S")

# Subsetting Data
dfSmall <- subset(df,Date == "2007-02-01" | Date == "2007-02-02")

#
y <- as.numeric(as.character(dfSmall$Global_active_power))

# Plotting
par(bg=NA)
plot(y,type="l",labels=FALSE,xlab=NA,ylab=NA,xaxt="n")
axis(1,at = c(0,1500,2880), labels = c("Thu","Fri","Sat"))
axis(2,at = c(0,2,4,6))
title(ylab = "Global Active Power (kilowatts)")
#

# Copying the histogram plot from screen to png graphic device 
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()

