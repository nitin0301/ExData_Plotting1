# Reading the data
df <- read.table("./household_power_consumption.txt",sep=";",header = TRUE)
df$Date <- strptime(df$Date,format="%d/%m/%Y")
df$Time <- format(strptime(df$Time,format="%H:%M:%S"),"%H:%M:%S")

# Subsetting Data
dfSmall <- subset(df,Date == "2007-02-01" | Date == "2007-02-02")

# Creating Histogram
par(bg=NA)
hist(as.numeric(as.character(dfSmall$Global_active_power)),
     col="red",
     main="Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# Copying the histogram plot from screen to png graphic device 
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()