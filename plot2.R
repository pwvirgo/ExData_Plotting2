## Coursera Exploratory Data Analysis  Project 2 Plot 2

setwd("~/a/highEd/dataScience_coursera/ExploreData/data")
NEI<-readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

ns<-NEI[NEI$fips=="24510",c(1,4,6)]   # city of Balitmore
#ns<-NEI[NEI$fips=="24031",c(1,4,6)]   # montgomery county

pd <- aggregate(ns[c("Emissions")] / 1000, list(year = ns$year), sum)

# set the margin parameters
par(mar=c(5,6,4,2)+ 0.1)

barplot(pd$Emissions,
   names.arg=c("1999","2002", "2005", "2008"),
   col="#B5A88E", 
   xlab="PM25 Polution is generally decreasing",
   ylab="Thousands of tons of PM25")
   title(main="Total PM25 in Baltimore by year")

dev.copy(png, "Plot2.png", height=480, width=480)
dev.off(4)
