## Coursera Exploratory Data Analysis  Project 2 Plot 1

setwd("~/a/highEd/dataScience_coursera/ExploreData/data")
NEI<-readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

pd <- aggregate(NEI[c("Emissions")] / 1000, list(year = NEI$year), sum)


# set the margins (mar) in the graphics parameters (par)
par(mar=c(5,5,4,2)+ 0.1)

barplot(pd$Emissions,
   names.arg=c("1999","2002", "2005", "2008"),
   col="#B5A88E", 
   xlab="PM25 Polution is decreasing",
   ylab="Thousands of tons of PM25")
title(main="Total PM25 in US by year")

dev.copy(png, "Plot1.png", height=480, width=480)
dev.off(4)
