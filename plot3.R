## Read in the data file from current working directory
df <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)

## get a subset of data for the two days required for the plot, exclude 
## rows where there is no data (which is denoted by a "?")
k <- subset(df, (df$Date == "1/2/2007" | df$Date == "2/2/2007") & df$Global_active_power != "?")

## Convert Date and Time string values to a proper Date type
k$DateTime <- strptime(paste(k$Date, k$Time),"%d/%m/%Y %H:%M:%S")

## Open the PNG graphics device to write to
png(file="plot3.png",width=480,height=480)

## Make the base plot with the first data seried coloured black and the y axis labeled
plot(k$DateTime, k$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")

## Add the second data series, coloured red
lines(k$DateTime, k$Sub_metering_2, type="l", col="red")

## Add the third data series, coloured blue
lines(k$DateTime, k$Sub_metering_3, type="l", col="blue")

## Add a legend at the top-right hand corner
legend('topright', names(k)[7:9] , lty=1, col=c('black',' red', 'blue'), bty='y', cex=.75)

## Close the PNG graphics device
dev.off()
