#Create Plot 5
vehicles2 <- unique(grep("Vehicles", SCC$EI.Sector, ignore.case = TRUE, value = TRUE))
vehicles <- SCC[SCC$EI.Sector %in% vehicles2, ]["SCC"]
Baltimorevehicles<- NEI[NEI$SCC %in% vehicles$SCC & NEI$fips == "24510",]
vehiclesYearly <- ddply(Baltimorevehicles, .(year), function(x) sum(x$Emissions))
colnames(vehiclesYearly)[2] <- "emissions"
#png("plot5.png", width = 480, height = 480)
qplot(year, emissions, data = vehiclesYearly, geom = "line", color = emissions, size = 1) + ggtitle("PM2.5 Emissions by Motor in Baltimore City") + xlab("Year") + ylab("PM2.5 Emissions in Tons")
#dev.off()