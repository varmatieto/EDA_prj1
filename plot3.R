# the file contains ONLY the two days under focus

epc<-read.table("household_power_consumption.txt", sep=";",header=T,
                stringsAsFactors = F)

# make date/time as a single variable
            
myTime<-paste(epc$Date, epc$Time)

myT<-strptime(myTime, "%d/%m/%Y %H:%M:%S")



png("plot3.png")

with (epc, plot(myT,Sub_metering_1, type="l",
                xlab="", ylab="Energy sub metering"))
with (epc, lines(myT,Sub_metering_2, type="l", col = "red"))
with (epc, lines(myT,Sub_metering_3, type="l", col = "Blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       pch = 1, col = c("black","red", "blue" )  )


dev.off()
