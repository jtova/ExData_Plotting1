# Primero filtramos la entrada 
# sed -n -e '1p' ./household_power_consumption.txt > household.txt
# sed -n -e '/^[12]\/2\/2007/p' ./household_power_consumption.txt >> household.txt

system("sed -n -e '1p' ./household_power_consumption.txt > plot1_data.txt", intern = FALSE,
       ignore.stdout = FALSE, ignore.stderr = FALSE,
       wait = TRUE, input = NULL)

system("sed -n -e '/^[12]\\/2\\/2007/p' ./household_power_consumption.txt >> plot1_data.txt", intern = FALSE,
       ignore.stdout = FALSE, ignore.stderr = FALSE,
       wait = TRUE, input = NULL)


data <- read.csv("./plot1_data.txt", sep = ";" , na.strings = "?")
library(data.table)

data$Time2 <- strptime(paste(as.character(data$Date), as.character(data$Time)), format="%d/%m/%Y %H:%M:%S")

DT <- data.table(data)


# Plot 1
DT$Global_active_power

hist(DT$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

