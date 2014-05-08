# the file contains ONLY the two days under focus

epc<-read.table("household_power_consumption.txt", sep=";",header=T,
                stringsAsFactors = F)

# make date/time as a single variable
            
myTime<-paste(epc$Date, epc$Time)

myT<-strptime(myTime, "%d/%m/%Y %H:%M:%S")





png("plot4.png")
par (mfrow=c(2,2))

with (epc, plot(myT,Global_active_power, type="l",
                ylab="Global Active Power", xlab=""   ))

with (epc, plot(myT,Voltage, type="l",
                xlab="datetime",ylab="Voltage"))

with (epc, plot(myT,Sub_metering_1, type="l",
                xlab="", ylab="Energy sub metering"))
with (epc, lines(myT,Sub_metering_2, type="l", col = "red"))
with (epc, lines(myT,Sub_metering_3, type="l", col = "Blue"))
legend("topright", legend = c("Sub_metering_1", 
                              "Sub_metering_2", "Sub_metering_3"),
       pch = 151, col = c("black","red", "blue" )  )

with (epc, plot(myT,Global_reactive_power, type="l",
                xlab="datetime"))

dev.off()
