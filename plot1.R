scs<-readRDS("Source_Classification_Code.rds")
pm25<-readRDS("summarySCC_PM25.rds")

pm251<-aggregate(pm25$Emissions,by=list(pm25$year),FUN=sum)
names(pm251)<-c("year","totalpm25")

png("plot1.png")
plot(pm251$year,pm251$totalpm25,type = "b",xlab="Year",ylab="Total PM2.5 (Tons)",
     main = "Total Emissions from PM2.5")
dev.off()