## Read in the data file from current working directory
df <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)

## get a subset of data for the two days required for the plot, exclude 
## rows where there is no data (which is denoted by a "?")
k <- subset(df, (df$Date == "1/2/2007" | df$Date == "2/2/2007") & df$Global_active_power != "?")

## Convert to numeric values so that hist() function works
k$newcol <- as.numeric(k$Global_active_power)

## Open the PNG graphics device to write to
png(file="plot1.png",width=480,height=480)

## Create the historgram and set the appropriate labels for the plot and the axes
## Set the colour of the bars to red

hist(k$newcol, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

## Close the PNG graphics device
dev.off()