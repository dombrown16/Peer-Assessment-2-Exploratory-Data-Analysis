# Script for plot1 to answer the question:
# Have total emissions from PM2.5 decreased in the United States from 
# 1999 to 2008? Using the base plotting system, make a plot showing the total 
# PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 
# 2008.

# Read in the data:
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(plyr)
# Group and Sum the PM2.5 Emission data by year:
emissions_by_year<-aggregate(Emissions ~ year, data=NEI, sum)

# Plot PM2.5 Emission in Million Tons vs Year and save as plot1.png:
png("plot1.png")
barplot(emissions_by_year$Emissions/1000000, col="red", 
        names.arg=emissions_by_year$year, 
        main=bquote("Total "~PM[2.5]~" Emissions in the US per year"),
        xlab="Year", ylab="Million Tons")
dev.off()