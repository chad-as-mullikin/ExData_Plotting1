rm(list=ls())
stuff <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), header=TRUE, sep=";")
days_of_interest <- stuff[as.Date(stuff$Date,"%d/%m/%Y")=="2007-02-01"|as.Date(stuff$Date,"%d/%m/%Y")=="2007-02-02" ,]
png(file = "plot1.png", width=480, height=480)
hist(as.numeric(as.character(days_of_interest$Global_active_power)), lab=c(4,6,2), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()