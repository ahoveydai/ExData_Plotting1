## Read in the data file from current working directory
df <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)

## get a subset of data for the two days required for the plot, exclude 
## rows where there is no data (which is denoted by a "?")
k <- subset(df, (df$Date == "1/2/2007" | df$Date == "2/2/2007") & df$Global_active_power != "?")

## Convert Date and Time string values to a proper Date type
k$DateTime <- strptime(paste(k$Date, k$Time),"%d/%m/%Y %H:%M:%S")

## Open the PNG graphics device to write to
png(file="plot4.png",width=480,height=480)

## Set up a grid of 2x2 plots
par(mfrow = c(2, 2))

## Make the first plot (re-used code from plot2.R)

plot(k$DateTime, k$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## make the second plot (simliar to the one above, except Voltage is plotted)
plot(k$DateTime, k$Voltage, type="l", ylab="Voltage" , xlab="datetime")

## make the third plot (re-used code from plot3.R), except no box around the legend

plot(k$DateTime, k$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(k$DateTime, k$Sub_metering_2, type="l", col="red")
lines(k$DateTime, k$Sub_metering_3, type="l", col="blue")
legend('topright', names(k)[7:9] , lty=1, col=c('black',' red', 'blue'), bty='n', cex=.75)

## make the last plot (re-used code from plot3.R), except no box around the legend
plot(k$DateTime, k$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
## Close the PNG graphics device
dev.off()
