# Create Plot2
Baltimore <- subset(NEI, fips == "24510")
totalBaltimore <- tapply(Baltimore$Emissions, Baltimore$year, sum)
#png("plot2.png", width = 480, height = 480)
par(bg = 'white')
barplot(totalBaltimore, col = rainbow(5, start = 0, end = 1), xlab = "Year", ylab = "Total PM2.5 Emissions (Tons)", main = "Yearly Emissions (tons) in Baltimore City, Maryland")
#dev.off()