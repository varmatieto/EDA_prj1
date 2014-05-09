# the file contains ONLY the two days under focus

epc<-read.table("household_power_consumption.txt", sep=";",header=T,
                stringsAsFactors = F)
 #               colClasses=c("strptime","Date","numeric",
 #               "numeric","numeric","numeric","numeric","numeric","numeric"))

head(epc)
str(epc)

hist(epc$Global_active_power)


myTime<-paste(epc$Date, epc$Time)
myTime[1]

myT<-strptime(myTime, "%d/%m/%Y %H:%M:%S")


################
myT[2000]
names(unclass(myT))

myTclass<-c("sec" ,  "min" ,  "hour" , "mday" , "mon" ,  "year" , "wday" ,
            "yday" ,"isdst")

sapply( myTclass, function(i) myT[[i]][2000] )


weekdays(myT[2000],abbreviate = T)
months(myT[2000])
################


with (epc, plot(myT,Global_active_power, type="l"))

with (epc, plot(myT,Voltage, type="l"))

with (epc, plot(myT,Global_reactive_power, type="l"))

jpeg("prova.jpg")

with (epc, plot(myT,Sub_metering_1, type="l", ))
with (epc, lines(myT,Sub_metering_2, type="l", col = "red"))
with (epc, lines(myT,Sub_metering_3, type="l", col = "Blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        pch = 1, col = c("black","red", "blue" )  )



dev.off()
