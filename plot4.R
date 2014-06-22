setwd("C:/users/Mauricio/jmaa46/data")          ## To create the working area
## to create the folder for the files of the assignment 2
if (!file.exists("Assignment2")) {
  dir.create("Assignment2")
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"        ##to locate the data files
download.file(fileUrl, destfile = "exdata_data_NEI_data")          ## to download the data
dateDownload <- date()
dateDownload                                                       ##The time of the download
setwd("./Assignment2")
NEI <- readRDS("summarySCC_PM25.rds")                               ##To read the data
SCC <- readRDS("source_Classification_Code.rds")
levels(SCC$Data.Category)                                         ## to see the levels of this varable and can select the coal sources
good <- c(SCC$Data.Category == "Point")                           ## the coal sources are in this level
point <- SCC[good,1]                                            ## to select the SCC column with the uses key and it is a factor
point <- as.character(point)                                    ## to convert the factor as character
point <- as.integer(point)                                      ## to convert the character as integer
point[6000:6010]                                                ## to identify which numbers correspond to a coal source 
point[200:210]                                                  ## to identify which numbers correspond to a coal source
NEI$SCC <- as.integer(NEI$SCC)                                  ## to convert the SCC column of the file NEI as integer
good <- c(NEI$SCC < 10300000)                                   ## to select in the NEI file the observations of a coal source
NNEI <- NEI[good,]
NNEI$year <- as.factor(NNEI$year)                               ## to convert the year as a factor
with (NNEI,boxplot(Emissions ~ year, col = "red", ylim = c(0,20),ylab = "Emissions"))    ## Create a boxplot on screen device
title(main = "Coal Combustion Emissions in USA")
dev.copy(png, file = "Plot4.png")                               ## copy my plot to a PNG file
dev.off

 