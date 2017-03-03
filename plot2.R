rm(list=ls())
stuff <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), header=TRUE, sep=";")
days_of_interest <- stuff[as.Date(stuff$Date,"%d/%m/%Y")=="2007-02-01"|as.Date(stuff$Date,"%d/%m/%Y")=="2007-02-02" ,]
png(file = "plot2.png", width=480, height=480)
plot( as.numeric(as.character(days_of_interest$Global_active_power)), type='l', xlab ="", ylab="Global Active Power (kilowatts)", lab=c(3,4,2), xaxt="n")
axis(1, at=c(1, nrow(days_of_interest)/2.0, nrow(days_of_interest)), labels=c("Thu", "Fri", "Sat"))
dev.off()