# Load the dataset if not exists: avoid reload data when 
# the script is run in a job
if (!exists("ds")) {
        source("loadData.R")
}

# plot3.png configuration
png(filename = "plot3.png", width = 480, height = 480, units = "px")

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
        pch=c(NA,NA,NA))
rm(rg) # not neede anymore
dev.off()
cat  ("plot3.png has been saved\n")