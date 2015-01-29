## Coursera Exploratory Data Analysis  Project 2 Plot 6
# -------------------------------------------------------------------
# Compare emissions from motor vehicle sources in Baltimore City with
# emissions from motor vehicle sources in Los Angeles County,
# California (fips == "06037"). Which city has seen greater changes
# over time in motor vehicle emissions? 
# --------------------------------------------------------------------

setwd("~/a/highEd/dataScience_coursera/ExploreData/data")
NEI<-readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# create a vector of booleans indicating which rows of SCC are desired 
wanted<-function(text) { grepl("Highway Veh", text, ignore.case="T") }
gotya<-sapply(SCC$Short.Name, wanted)

# create a character vector of all "Highway Veh" SCC codes 
scc<-as.character(SCC[gotya, "SCC"])

# create a dataframe keeping rows of appropriate SCC and fips codes
nei=NEI[(NEI$SCC %in% scc) & (NEI$fips=="24510" | NEI$fips=='06037'),
      c("fips", "Emissions", "year")]

# total the emissions for each combination of year and fips
pd<-aggregate(nei$Emissions,list(nei$year, nei$fips),FUN=sum)

# create a variable with proper labels for graphic
pd$county[pd$Group.2=="06037"]<-"Los Angeles"
pd$county[pd$Group.2=="24510"]<-"Baltimore"

library(ggplot2)

g<-ggplot(pd, aes(Group.1, log(x)))

g+geom_point(size=6) + facet_grid(county~.) + geom_smooth(method=lm) +
   labs(title=paste("Total yearly motor vehicle emissions changed\n",
   "more in Baltimore than in Los Angeles")) +
   labs(x="Year") + labs(y=expression("log of tons of " * PM[2.5])) + theme_bw(16)

dev.copy(png, "Plot6.png", height=480, width=480)
dev.off(4)
