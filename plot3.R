## Coursera Exploratory Data Analysis  Project 2 Plot 3
#---------------------------------------------------------------------
# Of the four types of sources indicated by the type (point, nonpoint,
# onroad, nonroad) variable, which of these four sources have seen
# decreases in emissions from 1999–2008 for Baltimore City?
# Which have seen increases in emissions from 1999–2008?
# Use the ggplot2 plotting system to make a plot answer this question.
#---------------------------------------------------------------------
setwd("~/a/highEd/dataScience_coursera/ExploreData/data")
NEI<-readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

ns<-NEI[NEI$fips=="24510",]   # city of Balitmore
ns$type<-as.factor(ns$type)

# add up the total emssions for each type and year
pdata<-aggregate(ns$Emissions,list(ns$year,ns$type),FUN="sum")

library(ggplot2)
g<-ggplot(pdata, aes(Group.1, x))

g+geom_point(size=4) + facet_grid(Group.2~.) + geom_smooth(method=lm) +
	labs(title="Yearly total emissions increased for type POINT") +
	labs(x="Year") + labs(y=expression("log " * PM[2.5]))

dev.copy(png, "Plot3.png", height=480, width=480)
dev.off(4)