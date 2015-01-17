## Coursera Exploratory Data Analysis  Project 2 Plot 1

setwd("~/a/highEd/dataScience_coursera/ExploreData/data")
NEI<-readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

#ns<-NEI[1:400,c(4,6)]
#table(ns$year)
#table(SCC$Pollutant)

E99<-sum(NEI$year==1999,NEI$Emissions) /1000
E02<-sum(NEI$year==2002,NEI$Emissions) /1000
E05<-sum(NEI$year==2005,NEI$Emissions) /1000
E08<-sum(NEI$year==2008,NEI$Emissions) /1000

# set the minimum and maximum value of y included in the barplot (the y value at the x axes)
min_y<-min(E99,E02,E05,E08) - 500
max_y<-max(E99,E02,E05,E08) + 500


par(mar=c(5,5,4,2)+ 0.1)
	
barplot(c(E99, E02, E05, E08) - min_y, names.arg=c("1999","2002", "2005", "2008"),
		ylim=c(min_y, max_y),
		col="#B5A88E", 
		xlab="PM25 Polution is increasing, not decreasing", ylab="Thousands of tons of PM25",
		offset=rep(c(min_y),each=4))
title(main="Total PM25 in US by year")

dev.copy(png, "Plot1.png", height=480, width=480)
dev.off(4)
