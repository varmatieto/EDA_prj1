# the file contains ONLY the two days under focus

epc<-read.table("household_power_consumption.txt", sep=";",header=T,
                stringsAsFactors = F)

# make date/time as a single variable
            
myTime<-paste(epc$Date, epc$Time)

myT<-strptime(myTime, "%d/%m/%Y %H:%M:%S")



))


png("plot2.png")

with (epc, 
      plot(myT,Global_active_power, type="l", 
     ylab="Global Active Power (kilowatts)", xlab=" "))

dev.off()
