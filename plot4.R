# Set the name of the day
backkup_locale <- Sys.getlocale('LC_TIME')
Sys.setlocale('LC_TIME', 'C')

# Read the data
setwd("e:/Coursera/04 - Exploratory Data Analysis/Coursera Project/")
df_data <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?", 
                   colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# Subset the data and convert datetime
df_data$Date <- as.Date (df_data$Date, '%d/%m/%Y')
df_data <- subset(df_data, df_data$Date %in% as.Date(c("2007-02-01","2007-02-02")) )
df_data$Date_time <- strptime(paste(df_data$Date, df_data$Time), format="%Y-%m-%d %H:%M:%S")
# as.POSIXct(paste(df_data$Date, df_data$Time), format="%Y-%m-%d %H:%M:%S")

# str(df_data[1000, ])

# Plot 4
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))
with(df_data, {
  plot(Date_time, Global_active_power, type = "l", 
       ylab = "Global Active Power", xlab = "")
  plot(Date_time, Voltage, type = "l", 
       ylab = "Voltage", xlab = "datetime")
  plot(Date_time, Sub_metering_1, type = "l", 
       ylab = "Energy sub metering", xlab = "")
  lines(Date_time, Sub_metering_2, col = 'Red')
  lines(Date_time, Sub_metering_3, col = 'Blue')
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Date_time, Global_reactive_power, type = "l", 
       ylab = "Global_rective_power", xlab = "datetime")
})

dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()

# Set back the name of the day
Sys.setlocale('LC_TIME', backkup_locale)