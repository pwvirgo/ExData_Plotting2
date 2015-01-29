## Coursera Exploratory Data Analysis  Project 2 Plot 4
#--------------------------------------------------------------------
# Across the United States, how have emissions from coal 
# combustion-related sources changed from 1999–2008?
#--------------------------------------------------------------------
setwd("~/a/highEd/dataScience_coursera/ExploreData/data")
NEI<-readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# ------------------------------------------------------------------
# Return TRUE if text contains "Coal" or "comb" (not case sensitive)
# else return FALSE
# -----------------------------------------------------------------
coalComb<-function(text) {
	grepl("coal", text, ignore.case="T") &
   	grepl("comb", text, ignore.case=T) }

# create vector of booleans for each SCC row wanted or not wanted 
gotya<-sapply(SCC$Short.Name,coalComb)

# create a character vector of SCC codes for the Coal Comb
scc<-as.character(SCC[gotya, "SCC"])

# select the rows and cols for the plot
nei=NEI[NEI$SCC %in% scc, c(4,6)]

# total the emissions for each year
pd<-aggregate(nei$Emissions, by=list(nei$year), FUN=sum)

library(ggplot2)
qplot(as.factor(pd$Group.1),pd$x/1000, geom="bar", stat="identity",
   main=paste("Total emissions from coal combustion in US",
       "\ndeclined from 1999-2008"),
   ylab=expression("Kilo-tons of " * PM[2.5]), xlab="Year") +
   theme(title=element_text(size=rel(1.5)),
           axis.text.x=element_text(size=rel(2)))

dev.copy(png, "Plot4.png", height=480, width=480)
dev.off(4)