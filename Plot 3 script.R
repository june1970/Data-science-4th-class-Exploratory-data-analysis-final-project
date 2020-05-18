#Create plot3
Baltimore <- subset(NEI, fips == "24510")
typeBaltimore <- ddply(Baltimore, .(year, type), function(x) sum(x$Emissions))
colnames(typeBaltimore)[3] <- "emissions"
#png("plot3.png", width = 480, height = 480)
par(bg = 'white')
qplot(year, emissions, data = typeBaltimore, color = type, geom = "line") + ggtitle("PM2.5 Emission by Type and Year in Baltimore City") + xlab("Year") + ylab("Total PM2.5 Emissions in tons") + theme(legend.position = c(0.8, 0.65))
#dev.off()