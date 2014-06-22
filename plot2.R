setwd("C:/users/Mauricio/jmaa46/data")      ## To create the working area
## To create the folder for the files of the assignment 2
if (!file.exists("Assignment2")) {
  dir.create("Assignment2")
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"     ##to locate the data files
download.file(fileUrl, destfile = "exdata_data_NEI_data")     ##to download the data
dateDownload <- date()
dateDownload                                                  ## the time of the download
setwd("./Assignment2")                                        
NEI <- readRDS("summarySCC_PM25.rds")                          ## to charge the data
SCC <- readRDS("source_Classification_Code.rds")
good <- c(NEI$fips == "24510")                              ## to select the Baltimore City's observations                          
NNEI <- NEI[good,]
NNEI$year <- as.factor(NNEI$year)                           ##to put the column year as a factor
tapply(NNEI$Emissions,NNEI$year, summary)                   ## to have a view of the data
good <- c(NNEI$Emissions < 2.07)                            ## to eliminate the observations greater than 2.07
NNEII <- NNEI[good,]
with(NNEII,boxplot(Emissions ~ year,col = "red", ylim= c(0,1.5)))     ##to use a boxplot
title(main = "Total Emissions in Baltimore City, Maryland")
dev.copy(png, file = "Plot2.png")                           ## to copy as a png file
dev.off
tapply(NNEII$Emissions,NNEII$year, summary)              ## to see the statistics of the data plotted
