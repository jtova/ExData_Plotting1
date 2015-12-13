# Primero filtramos la entrada 
# sed -n -e '1p' ./household_power_consumption.txt > household.txt
# sed -n -e '/^[12]\/2\/2007/p' ./household_power_consumption.txt >> household.txt

system("sed -n -e '1p' ./household_power_consumption.txt > plot2_data.txt", intern = FALSE,
       ignore.stdout = FALSE, ignore.stderr = FALSE,
       wait = TRUE, input = NULL)

system("sed -n -e '/^[12]\\/2\\/2007/p' ./household_power_consumption.txt >> plot2_data.txt", intern = FALSE,
       ignore.stdout = FALSE, ignore.stderr = FALSE,
       wait = TRUE, input = NULL)


data <- read.csv("./plot2_data.txt", sep = ";" , na.strings = "?")
library(data.table)

data$Time2 <- strptime(paste(as.character(data$Date), as.character(data$Time)), format="%d/%m/%Y %H:%M:%S")

DT <- data.table(data)


# Plot 2


plot(y = DT$Global_active_power, x = DT$Time2, type = "l", ylab = "Global Active Power (kilowatts)", xlab="")
