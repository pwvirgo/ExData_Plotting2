## Coursera Exploratory Data Analysis  Project 2 Plot 2

setwd("~/a/highEd/dataScience_coursera/ExploreData/data")
NEI<-readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

ns<-NEI[NEI$fips=="24510",c(1,4,6)]   # city of Balitmore
#ns<-NEI[NEI$fips=="24031",c(1,4,6)]   # montgomery county

E99<-sum(ns$year==1999,NEI$Emissions) /1000
E02<-sum(ns$year==2002,NEI$Emissions) /1000
E05<-sum(ns$year==2005,NEI$Emissions) /1000
E08<-sum(ns$year==2008,NEI$Emissions) /1000

# set the minimum and maximum value of y included in the barplot (the y value at the x axes)
min_y<-min(E99,E02,E05,E08) -.1
max_y<-max(E99,E02,E05,E08) +.1

par(mar=c(5,6,4,2)+ 0.1)

barplot(c(E99, E02, E05, E08) - min_y, names.arg=c("1999","2002", "2005", "2008"),
		ylim=c(min_y, max_y),
		col="#B5A88E", 
		xlab="PM25 Polution is increasing slightly, not decreasing", ylab="Thousands of tons of PM25",
		offset=rep(c(min_y), each=4))
title(main="Total PM25 in Baltimore by year")

dev.copy(png, "Plot2.png", height=480, width=480)
dev.off(4)

