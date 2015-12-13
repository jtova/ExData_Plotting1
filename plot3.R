# Primero filtramos la entrada 
# sed -n -e '1p' ./household_power_consumption.txt > household.txt
# sed -n -e '/^[12]\/2\/2007/p' ./household_power_consumption.txt >> household.txt

system("sed -n -e '1p' ./household_power_consumption.txt > plot3_data.txt", intern = FALSE,
       ignore.stdout = FALSE, ignore.stderr = FALSE,
       wait = TRUE, input = NULL)

system("sed -n -e '/^[12]\\/2\\/2007/p' ./household_power_consumption.txt >> plot3_data.txt", intern = FALSE,
       ignore.stdout = FALSE, ignore.stderr = FALSE,
       wait = TRUE, input = NULL)


data <- read.csv("./plot3_data.txt", sep = ";" , na.strings = "?")
library(data.table)

data$Time2 <- strptime(paste(as.character(data$Date), as.character(data$Time)), format="%d/%m/%Y %H:%M:%S")

DT <- data.table(data)


#plot(y = c(DT$Sub_metering_1, DT$Sub_metering_2, DT$Sub_metering_3), x = c(DT$Time2, DT$Time2, DT$Time2), type = "l", ylab = "Energy sub metering", xlab="")
par(mfrow = c(1, 1))
plot(y = DT$Sub_metering_1, x = DT$Time2, type = "l", ylab = "Energy sub metering", xlab="")
points(y = DT$Sub_metering_2, x = DT$Time2, type = "l", col="blue")
points(y = DT$Sub_metering_3, x = DT$Time2, type = "l", col="red")


legend("topright", pch = "l", col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

