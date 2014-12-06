# Load the dataset if not exists: avoid reload data when 
# the script is run in a job
if (!exists("ds")) {
        source("loadData.R")
}

# plot4.png configuration
png(filename = "plot4.png", width = 480, height = 480, units = "px")

# Create the "grid for plots"

par(mfrow=c(2,2))

# 1,1 plot #############################################3
# Line graph for Global_active_power by DateTime
plot(ds$DateTime,ds$Global_active_power,
     type="l",
     ylab = "Global Active Power (in kilowatts)",
     xlab = ""
)

# 1,2 plot #############################################3
# Line graph for Voltage by DateTime
plot(ds$DateTime,ds$Voltage,
     type="l",
     ylab = "Voltage",
     xlab = ""
)
# 2,1 plot #############################################3
# this is the range of 3 variables
rg<-range(c(ds$Sub_metering_1,ds$Sub_metering_2,ds$Sub_metering_3))

# Three variables (Sub_metereing_1 to 3) in the same plot
plot(ds$DateTime,ds$Sub_metering_1,
     col="black", 
     type="l",
     ylim=rg,
     axes = FALSE,ylab="",xlab="")
par(new=TRUE)
plot(ds$DateTime,ds$Sub_metering_2,
     col="red", 
     type="l",
     ylim=rg, 
     axes = FALSE,ylab="",xlab="")
par(new=TRUE)
plot(ds$DateTime,ds$Sub_metering_3,
     col="blue", 
     type="l",
     ylim=rg,  
     ylab="Energy sub metering",xlab="")

# legend
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lwd = 1,
       cex = 0.5,
       pch=c(NA,NA,NA))
rm(rg) # not neede anymore
# 2,2 plot #############################################3
# Line graph for Voltage by DateTime
plot(ds$DateTime,ds$Global_reactive_power,
     type="l",
     ylab = "Global Reactive Power",
     xlab = ""
)

dev.off()
cat  ("plot4.png has been saved\n")