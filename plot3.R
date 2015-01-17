## Coursera Exploratory Data Analysis  Project 2 Plot 2

setwd("~/a/highEd/dataScience_coursera/ExploreData/data")
NEI<-readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

ns<-NEI[NEI$fips=="24510",]   # city of Balitmore


