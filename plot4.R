scs<-readRDS("Source_Classification_Code.rds")
pm25<-readRDS("summarySCC_PM25.rds")

scs1<-subset(scs,scs$EI.Sector=="Fuel Comb - Comm/Institutional - Coal"| 
               scs$EI.Sector=="Fuel Comb - Electric Generation - Coal"|
               scs$EI.Sector=="Fuel Comb - Industrial Boilers, ICEs - Coal")
scs1$SCC<-droplevels(scs1$SCC)
scs1$SCC<-as.character(scs1$SCC)
pm251<-subset(pm25,SCC %in% scs1$SCC)
pm252<-aggregate(pm251$Emissions,by=list(pm251$year),FUN=sum)
names(pm252)<-c("year","pm25")

png("plot4.png")
plot(pm252$year,pm252$pm25,type = "p",xlab="Year",ylab="Total PM2.5 (Tons)",
     main = "Total Emissions from PM2.5 - Across the US")
lines(pm252$year,pm252$pm25)
dev.off()



