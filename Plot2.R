# Script for plot2 to answer the question:
# Have total emissions from PM2.5 decreased in the Baltimore City,
# Maryland (fips == "24510") from 1999 to 2008?
# Use the base plotting system to make a plot answering this question.

# Read in the data:
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(plyr)
# Group and Sum the Emission data by year:
NEI_Baltimore<-NEI[NEI$fips==24510,]
Baltimore_emissions_by_year<-aggregate(Emissions ~ year,data=NEI_Baltimore, sum)

# Plot PM2.5 Emission in Million Tons vs Year and save as plot2.png:
png("plot2.png")
barplot(Baltimore_emissions_by_year$Emissions, col="red", 
        names.arg=Baltimore_emissions_by_year$year, 
        main=bquote("Total "~PM[2.5]~" Emissions in Baltimore per year"),
        xlab="Year", ylab="Tons")
dev.off()