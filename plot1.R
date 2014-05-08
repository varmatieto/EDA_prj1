# the file contains ONLY the two days under focus

epc<-read.table("household_power_consumption.txt", sep=";",header=T,
                stringsAsFactors = F)
 
head(epc)
str(epc)

png("plot1.png")
hist(epc$Global_active_power, col="red", 
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
dev.off()
