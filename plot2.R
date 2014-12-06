# Load the dataset if not exists: avoid reload data when 
# the script is run in a job
if (!exists("ds")) {
        source("loadData.R")
}

# plot1.png configuration
png(filename = "plot2.png", width = 480, height = 480, units = "px")

# Line graph for Global_active_power by DateTime
plot(ds$DateTime, ds$Global_active_power,
     type="l",
     ylab = "Global Active Power (in kilowatts)",
     xlab = ""
     )


dev.off()
cat  ("plot2.png has been saved\n")