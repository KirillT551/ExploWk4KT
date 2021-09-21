library(ggplot2)

scs<-readRDS("Source_Classification_Code.rds")
pm25<-readRDS("summarySCC_PM25.rds")

pm25$fips<-as.numeric(pm25$fips)
pm251<-subset(pm25,pm25$fips=="24510")
pm252<-aggregate(pm251$Emissions,by=list(pm251$year,pm251$type),FUN=sum)
names(pm252)<-c("year","type","totalpm25")

plot3<-qplot(year,totalpm25,data=pm252,colour=type,
      ylab="Total Emissions from PM2.5 (tons)",xlab="Year")+geom_line()+
      ggtitle("Total Emissions by type in Baltimore City, Maryland") +
      theme(plot.title = element_text(hjust=0.5)) +
      labs(colour="Type")
png("plot3.png")
print(plot3)
dev.off()
