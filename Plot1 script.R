## install necessary library: ggplot2, base, plyr
library(plyr)
library(ggplot2)
library(grid)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
totalNEI <- tapply(NEI$Emissions, NEI$year, sum)
#png("plot1.png", width = 480, height = 480)
par(bg = 'white')
barplot(totalNEI, col = rainbow(10, start = 0, end = 1), xlab = "Year", ylab = "Total PM2.5 Emissions in Tons", main = "Total PM 2.5 Emissions (tons) in USA")
#dev.off()