#
# 03/12/2014 blg Coursera's 
#       
#       This is the script for the first course project of
#       "Exploratory Data Analysis" course 
#
#       The scripts download the data if necessary,
#       loads the partial dataset and plots
#
# 

library(sqldf,quietly=FALSE)



# Path to data 


# get the base dir and download data if needed
source("getFile.R")

filename <- getFile()

# The data set only for selected days
cat(paste("Loading file ",filename," ..."))
ds <- read.csv.sql(filename,sep=";", "select * from file where Date in ( '1/2/2007','2/2/2007')")
cat ("done!\n")

# Close connections
sqldf()

# Column with compund DateTime will be made easy plotting
ds$DateTime<-strptime( apply( ds[ , c("Date","Time") ], 1, paste, collapse=" "), "%d/%m/%Y %H:%M:%S")

