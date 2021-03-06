rm(list=ls())
stuff <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), header=TRUE, sep=";")
days_of_interest <- stuff[as.Date(stuff$Date,"%d/%m/%Y")=="2007-02-01"|as.Date(stuff$Date,"%d/%m/%Y")=="2007-02-02" ,]
png(file = "plot3.png", width=480, height=480)
plot(as.numeric(as.character(days_of_interest$Sub_metering_1)), type='l', col="black", xlab="", ylab="Energy sub metering", xaxt="n", lab=c(3,4,2))
lines(as.numeric(as.character(days_of_interest$Sub_metering_2)), type='l', col="red", xaxt="n")
lines(as.numeric(as.character(days_of_interest$Sub_metering_3)), type='l', col="blue", xaxt="n")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1 )
axis(1, at=c(1, nrow(days_of_interest)/2.0, nrow(days_of_interest)), labels=c("Thu", "Fri", "Sat"))
dev.off()