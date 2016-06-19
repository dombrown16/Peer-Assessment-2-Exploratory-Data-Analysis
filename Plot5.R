# Plot5.R script to answer the question:
# How have emissions from motor vehicle sources changed from 1999-2008 
# in Baltimore City?

# Read in the data:
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# create subset of Baltimore City, Maryland Data (fips == "24510"):
BA <- NEI[(NEI$fips == "24510"),]

total <- aggregate(Emissions ~ year + type, data = BA, sum)

sub <- total[which(total$type == "ON-ROAD"),]

png(filename = "plot5.png")
with(sub, barplot(Emissions, names.arg = year, xlab="Year", col="red",
                  ylab="Total Emissions in Tons",
                  main = "Total PM2.5 Emissions from Motor Vehicles in Baltimore per year"))
dev.off() 