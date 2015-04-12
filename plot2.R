## Read in the data file from current working directory
df <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)

## get a subset of data for the two days required for the plot, exclude 
## rows where there is no data (which is denoted by a "?")
k <- subset(df, (df$Date == "1/2/2007" | df$Date == "2/2/2007") & df$Global_active_power != "?")

## Convert Date and Time string values to a proper Date type
k$DateTime <- strptime(paste(k$Date, k$Time),"%d/%m/%Y %H:%M:%S")

## Open the PNG graphics device to write to
png(file="plot2.png",width=480,height=480)

## Plot the Global Active Power against the date/time for the 2 days.  Set the Y axis label
## to "Global Active Power (kilowatts)" and set the X axis label to an empty string

plot(k$DateTime, k$Global_active_power, type="l", ylab="Global Active Power (kilowatts)" , xlab="")

## Close the PNG graphics device
dev.off()
