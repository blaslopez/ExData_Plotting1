#
# This script request for downloading the original dataset
# or the location where the user has the data


getFile <- function () {
        
        cat("Electric power consumption Dataset, do you need to download? \n")
        download <- "x"
        while ( sum(toupper(download) == c("Y","N","C")) == 0) {
                cat("Type [Y]es, [N]o or [C]ancel")
                download <- scan(what=character(),nmax=1,quiet=TRUE)
        }
        
        fname <- ""
        
        if (toupper(download) != "C") {
                
                if (toupper(download) == "Y") {
                        cat("Downloading....")
                        url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
                        download.file(url,dest="data.zip")
                        unzip(zipfile = "data.zip", exdir="data",overwrite=TRUE)
                        fname = paste("data",.Platform$file.sep,"household_power_consumption.txt",sep="")
                } else {
                        cat("Locate the file to load using the File Chooser in the popup window \n")  
                        fname <- file.choose()
                }
        }
        
        fname
        
}
