setwd("C:/users/Mauricio/jmaa46/data")     ## To create the working area
## to create the folder  for the files of the assignment 2
if (!file.exists("Assignment2")) {         
  dir.create("Assignment2")
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"     ## to locate the data files
download.file(fileUrl, destfile = "exdata_data_NEI_data")     ## to download the data
dateDownload <- date()
dateDownload                              ## The time of the download
setwd("./Assignment2")
NEI <- readRDS("summarySCC_PM25.rds")        ## to charge the data
SCC <- readRDS("source_Classification_Code.rds")
head(NEI)                                    ## to have a view of the dataset
dim(NEI)
dim(SCC)
str(NEI)
NEI$year <- as.factor(NEI$year)  ## to convert the column year in a factor
tapply(NEI$Emissions,NEI$year, summary)     ## We can observe the principal statistics 
                           ## by year
good1 <- c(NEI$Emissions > 0)  ## To eliminate the observations equal to zero
NNEI <- NEI[good1,]
good2 <- c(NNEI$Emissions < 0.26)   ## to eliminate the observations above 75%
NNEII <- NNEI[good2,]
with (NNEII, boxplot(Emissions ~ year , col = "red"))  ## Create boxplot on screen device
title(main = "Total Emissions from PM 2.5 from all Sources")
dev.copy =(png, file = "plot1.png")    ## Copy my plot to a PNG file
dev.off()        ## Close th PNG device
tapply(NNEII$Emissions, NNEII$year, summary) ## We can observe a better situation in 2002 and 2005 than 1999
           ## with an ligth upward in 2008- 