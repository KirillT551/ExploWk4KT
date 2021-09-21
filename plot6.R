library(ggplot2)

scs<-readRDS("Source_Classification_Code.rds")
pm25<-readRDS("summarySCC_PM25.rds")

scs2<-names(table(grep("Mobile",scs$EI.Sector,value=TRUE)))
scs2<-as.data.frame(scs2)

scs1<-subset(scs,scs$EI.Sector %in% scs2$scs2)
scs1$SCC<-droplevels(scs1$SCC)
scs1$SCC<-as.character(scs1$SCC)
pm251<-subset(pm25,SCC %in% scs1$SCC)

pm252<-subset(pm251,fips == "24510" | fips =="06037")
pm253<-aggregate(pm252$Emissions,by=list(pm252$year,pm252$fips),FUN=sum)
names(pm253)<-c("year","state", "totalpm25")


plot6<-qplot(year,totalpm25,data=pm253,colour=state,
      ylab="Total Emissions from PM2.5 (tons)",xlab="Year")+geom_line()+
  ggtitle("Total Vehicle Emissions by type in Baltimore City vs Los Angeles County") +
  theme(plot.title = element_text(hjust=0.5)) +
  labs(colour="Type")
png("plot6.png")
print(plot6)
dev.off()