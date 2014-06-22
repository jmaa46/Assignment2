setwd("C:/users/Mauricio/jmaa46/data")     ##To create the working area
## to create the folder for the files of the assignment 2
if (!file.exists("Assignment2")) {
  dir.create("Assignment2")
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"  ## to locate the data files
download.file(fileUrl, destfile = "exdata_data_NEI_data")      ##to download the data
dateDownload <- date()
dateDownload                                                ## the time of the download
setwd("./Assignment2")
NEI <- readRDS("summarySCC_PM25.rds")                       ## to read the data
SCC <- readRDS("source_Classification_Code.rds")
good <- c(NEI$fips == "24510")                              ## to select the data from Baltimore City
NNEI <- NEI[good,]
NNEI$year <- as.factor(NNEI$year)                            ## to convert the year column as a factor
tapply(NNEI$Emissions,NNEI$year, summary)                     ## to see the data statistics to eliminate outliers
good <- c(NNEI$Emissions < 2.00)                              ## to eliminate the data with emissions greater than 2
NNEII <- NNEI[good,]
library(ggplot2)
g <- ggplot(NNEII, aes(year,Emissions))                       ## To create a ggplot graph
g + geom_point(alpha = 1/3, size = 4, color ="steelblue") + 
facet_wrap(type ~ year, nrow = 2) + 
labs(title = "Baltimore City Emissions of four type of Pollutants") +
ylim(0,2)
dev.copy(png, file = "Plot3.png")                            ## Copy my plot to a PNG file
dev.off
