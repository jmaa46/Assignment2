setwd("C:/users/Mauricio/jmaa46/data")      ## To create the working area
## to create the folder for the files of the assignment 2
if (!file.exists("Assignment2")) {
  dir.create("Assignment2")
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"       ## to locate the data files
download.file(fileUrl, destfile = "exdata_data_NEI_data")        ## to download the data
dateDownload <- date()
dateDownload                                                      ## the time of the download
setwd("./Assignment2")
NEI <- readRDS("summarySCC_PM25.rds")                             ## to charge the data
SCC <- readRDS("source_Classification_Code.rds")
good <- c(NEI$fips == "24510")                                 ## to select the Baltimore City's observations
NNEI <- NEI[good,]
NNEI$year <- as.factor(NNEI$year)                              ## To convert the column year as a factor
good <- c(NNEI$type == "ON-ROAD")                              ## to select the "ON-ROAD" observations
NNEII <- NNEI[good,]
with(NNEII, boxplot(Emissions ~ year, col = "blue", ylim = c(0,4), ylab = "Emissions"))   ## create a boxplot
title(main= "Emissions from motor vehicle sources in Baltimore City")
dev.copy(png, file = "Plot5.png")                                 ## copy my plot to a PNG file
dev.off
 