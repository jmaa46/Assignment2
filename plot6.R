setwd("C:/users/Mauricio/jmaa46/data")     ## To create the working area
## to create the folder for the files of the assignment 2
if (!file.exists("Assignment2")) {
  dir.create("Assignment2")
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"     ##to locate the data files
download.file(fileUrl, destfile = "exdata_data_NEI_data")      ## To download the data 
dateDownload <- date()
dateDownload                                             ## the time of the download
setwd("./Assignment2")
NEI <- readRDS("summarySCC_PM25.rds")                    ## to read the data
SCC <- readRDS("source_Classification_Code.rds")
good <- c(NEI$fips == "24510" | NEI$fips == "06037")     ## to select the data from Baltimore City and Los Angeles County
NNEI <- NEI[good,]
NNEI$year <- as.factor(NNEI$year)                         ## to convert the year column as a factor
good <- c(NNEI$type == "ON-ROAD")                         ## to select the observations with type ON-ROAD
f<- factor(f,labels = c("Baltimore City","Los Angeles County"))    ## To create a factor with both cities
library(lattice)                                           ## calling the lattice package
## Create a xyplot
xyplot(NNEII$Emissions ~ NNEII$year | f , layout = c (2,1),ylim = c(0,10), main = "Emissions from motor vehicle sources in Los Angeles and Baltimore City")
dev.copy(png, file = "Plot6.png")      ## Copy my plot to a PNG file
dev.off
 