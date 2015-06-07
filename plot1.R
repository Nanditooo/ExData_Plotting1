# Read the data
setwd("e:/Coursera/04 - Exploratory Data Analysis/Coursera Project/")
df_data <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?", 
                   colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# Subset the data and convert datetime
df_data$Date <- as.Date (df_data$Date, '%d/%m/%Y')
df_data <- subset(df_data, df_data$Date %in% as.Date(c("2007-02-01","2007-02-02")) )
df_data$Date_time <- strptime(paste(df_data$Date, df_data$Time), format="%Y-%m-%d %H:%M:%S")
# as.POSIXct(paste(df_data$Date, df_data$Time), format="%Y-%m-%d %H:%M:%S")

str(df_data[1000, ])

# Plot 1
par(mfrow = c(1, 1), mar = c(4, 4, 2, 1))
hist(df_data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()