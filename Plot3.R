# Script for plot3 to answer the question:
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad)
# variable, which of these four sources have seen decreases in emissions from 1999-2008
# for Baltimore City? Which have seen increases in emissions from 1999-2008?
# Use the ggplot2 plotting system to make a plot answer this question.


# Read in the data:
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(plyr)
library(ggplot2)
# Group and Sum the Emission data by year:
NEI_Baltimore<-NEI[NEI$fips==24510,]
Baltimore_emissions_by_year<-aggregate(Emissions ~ year + type,
                                       data=NEI_Baltimore, sum)

png("plot3.png")
c <- ggplot(Baltimore_emissions_by_year, aes(x=factor(year), 
                                             y=Emissions, fill=type))
c + geom_bar(stat="identity", 
             position=position_dodge(), 
             color="black") + 
  labs(title=bquote("Total "~PM[2.5]~
                      " Emissions in Baltimore per Year and Source."),
       x="Year", y="Emissions [Tons]")
dev.off()