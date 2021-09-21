scs<-readRDS("Source_Classification_Code.rds")
pm25<-readRDS("summarySCC_PM25.rds")

scs2<-names(table(grep("Mobile",scs$EI.Sector,value=TRUE)))
scs2<-as.data.frame(scs2)

scs1<-subset(scs,scs$EI.Sector %in% scs2$scs2)
scs1$SCC<-droplevels(scs1$SCC)
scs1$SCC<-as.character(scs1$SCC)
pm251<-subset(pm25,SCC %in% scs1$SCC)

pm252<-subset(pm251,fips == "24510")
pm253<-aggregate(pm252$Emissions,by=list(pm252$year),FUN=sum)
names(pm253)<-c("year","totalpm25")

png("plot5.png")
plot(pm253$year,pm253$totalpm25,type = "b",xlab="Year",ylab="Total PM2.5 (Tons)",
     main = "Total Vehicle Emissions from PM2.5 - Baltimore City, Maryland")
dev.off()