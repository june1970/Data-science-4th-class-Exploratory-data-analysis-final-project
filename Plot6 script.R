# Create Plot6
vehicles3 <- unique(grep("Vehicles", SCC$EI.Sector, ignore.case = TRUE, value = TRUE))
vehicles <- SCC[SCC$EI.Sector %in% vehicles3, ]["SCC"]
vehiclesBal<- NEI[NEI$SCC %in% vehicles$SCC & NEI$fips == "24510",]
vehiclesLos<- NEI[NEI$SCC %in% vehicles$SCC & NEI$fips == "06037",]
vehiclesCom<- rbind(vehiclesBal, vehiclesLos)
vehiclesComYearly <- aggregate(Emissions ~ fips * year, data = vehiclesCom, FUN = sum )
vehiclesComYearly$county <- ifelse(vehiclesComYearly$fips == "06037", "Los Angeles", "Baltimore")
#png("plot6.png", width = 800, height = 480)
qplot(year, Emissions, data = vehiclesComYearly, geom = "line", color = county, size = Emissions) + ggtitle("PM2.5 Emissions by Motor Vehicles in Baltimore City Vs Los Angeles") + xlab("Year") + ylab("PM2.5 Emissions in Tons")
#dev.off()