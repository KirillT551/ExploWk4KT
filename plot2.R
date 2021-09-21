scs<-readRDS("Source_Classification_Code.rds")
pm25<-readRDS("summarySCC_PM25.rds")

pm25$fips<-as.numeric(pm25$fips)
pm251<-subset(pm25,pm25$fips=="24510")
pm252<-aggregate(pm251$Emissions,by=list(pm251$year),FUN=sum)
names(pm252)<-c("year","totalpm25")

png("plot2.png")
plot(pm252$year,pm252$totalpm25,type = "p",xlab="Year",ylab="Total PM2.5 (Tons)",
     main = "Total Emissions from PM2.5 - Baltimore City, Maryland")
lines(pm252$year,pm252$totalpm25)
dev.off()