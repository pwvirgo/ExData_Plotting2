## Coursera Exploratory Data Analysis  Project 2 Plot 5
#-----------------------------------------------------------------------------
# How have emissions from motor vehicle sources changed from 1999–2008
#  in Baltimore City?
#-----------------------------------------------------------------------------
setwd("~/a/highEd/dataScience_coursera/ExploreData/data")
NEI<-readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

wanted<-function(text) {  grepl("Highway Veh", text, ignore.case="T") }

# create a locical vector of wanted SCC rows 
gotya<-sapply(SCC$Short.Name,wanted)

# create a character vector of SCC codes for the Coal Comb
scc<-as.character(SCC[gotya, "SCC"])

# finally select the rows and cols for the plot
nei=NEI[(NEI$SCC %in% scc) & NEI$fips=="24510", c("Emissions", "year")]

pd<-aggregate(nei$Emissions,list(nei$year),FUN=sum)

library(ggplot2)
qplot(as.factor(pd$Group.1),pd$x, geom="bar", stat="identity",
	  main=paste("Total highway vehicles emissions in Baltimore MD",
	  		   "\ndeclined from 1999-2008"),
	  ylab=expression("Total tons of " * PM[2.5]), xlab="Year") +
	theme(title=element_text(size=rel(1.25)),
		  axis.text.x=element_text(size=rel(2)))

dev.copy(png, "Plot5.png", height=480, width=480)
dev.off(4)






