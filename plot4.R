rm(list=ls())
stuff <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), header=TRUE, sep=";")
days_of_interest <- stuff[as.Date(stuff$Date,"%d/%m/%Y")=="2007-02-01"|as.Date(stuff$Date,"%d/%m/%Y")=="2007-02-02" ,]
png(file = "plot4.png", width=480, height=480)
par(mfrow=c(2,2))
#Plot 1
plot( as.numeric(as.character(days_of_interest$Global_active_power)), type='l', xlab ="", ylab="Global Active Power", lab=c(3,4,2), xaxt="n")
axis(1, at=c(1, nrow(days_of_interest)/2.0, nrow(days_of_interest)), labels=c("Thu", "Fri", "Sat"))

#Plot 2
plot( as.numeric(as.character(days_of_interest$Voltage)), type='l', xlab ="datetime", ylab="Voltage", lab=c(3,8,2), xaxt="n")
axis(1, at=c(1, nrow(days_of_interest)/2.0, nrow(days_of_interest)), labels=c("Thu", "Fri", "Sat"))

#Plot 3
plot(as.numeric(as.character(days_of_interest$Sub_metering_1)), type='l', col="black", xlab="", ylab="Energy sub metering", xaxt="n", lab=c(3,4,2))
lines(as.numeric(as.character(days_of_interest$Sub_metering_2)), type='l', col="red", xaxt="n")
lines(as.numeric(as.character(days_of_interest$Sub_metering_3)), type='l', col="blue", xaxt="n")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, bty="n" )
axis(1, at=c(1, nrow(days_of_interest)/2.0, nrow(days_of_interest)), labels=c("Thu", "Fri", "Sat"))

#Plot 4
plot( as.numeric(as.character(days_of_interest$Global_reactive_power)), type='l', xlab ="datetime", ylab="Global_rective_power", lab=c(3,6,2), xaxt="n")
axis(1, at=c(1, nrow(days_of_interest)/2.0, nrow(days_of_interest)), labels=c("Thu", "Fri", "Sat"))
dev.off()