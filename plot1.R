# Load the dataset if not exists: avoid reload data when 
# the script is run in a job
if (!exists("ds")) {
        source("loadData.R")
}

# plot1.png configuration

png(filename = "plot1.png", width = 480, height = 480, units = "px")

# histrogram for Gloabl_active_power
hist(ds$Global_active_power,
     col="red",
     xlab = "Global Active Power (in kilowatts)", 
     main = "Global Active Power")


dev.off()
cat  ("plot1.png has been saved\n")