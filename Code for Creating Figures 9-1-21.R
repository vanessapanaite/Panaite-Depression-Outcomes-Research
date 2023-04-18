
### Nathan Cohen ###
### Code for Creating Graphs for Vanessa's Dissertation ###
### Written on 8-28-21 ###

library(sas7bdat)
dissData <- read.sas7bdat(file="C:/Users/njcoh/OneDrive/Documents/VA Job/Vanessa's Dissertation/Data/dissData.sas7bdat")

### Split into separate datasets based on depression status ###
healthyData <- dissData[dissData$Group == 0,]
deprData <- dissData[dissData$Group == 1,]

### Trends in ratings by call ###

png(filename="C:/Users/njcoh/OneDrive/Documents/VA Job/Vanessa's Dissertation/SAS Code/SAS Output/Vanessa's Dissertation - Figure 1 2-14-23.jpg", width=8, height=8, units="in", res=300)
par(mar = c(6, 4, 1.25, 0) + 0.1, mgp = c(0, 0.6, 0), mfrow=c(2,2))

### Controls ###
plot(NA, xlab="", ylab="", axes=FALSE, xlim=c(1,10), ylim=c(0,6))
title(main="Healthy Controls", font=2, cex.main=2, line=0)
mtext("Call", 1, font=2, cex=1.5, line=2.25)
mtext("Rating", 2, font=2, cex=1.5, line=2.25)
axis(1, at=c(1:10), font=2, cex.axis=1.25)
axis(2, at=c(0:6), font=2, las=1, cex.axis=1.25)
lines(smooth.spline(x=healthyData$Call[healthyData$TaskNum == -2], y=healthyData$Rating[healthyData$TaskNum == -2], spar=0.25), lwd=5, col="blue") 
lines(smooth.spline(x=healthyData$Call[healthyData$TaskNum == -1], y=healthyData$Rating[healthyData$TaskNum == -1], spar=0.25), lwd=5, col="green")
lines(smooth.spline(x=healthyData$Call[healthyData$TaskNum == 0], y=healthyData$Rating[healthyData$TaskNum == 0], spar=0.25), lwd=5, col="purple")
lines(smooth.spline(x=healthyData$Call[healthyData$TaskNum == 1], y=healthyData$Rating[healthyData$TaskNum == 1], spar=0.25), lwd=5, col="red")
lines(smooth.spline(x=healthyData$Call[healthyData$TaskNum == 2], y=healthyData$Rating[healthyData$TaskNum == 2], spar=0.25), lwd=5, col="brown")


### Depressed Participants ###
plot(NA, xlab="", ylab="", axes=FALSE, xlim=c(1,10), ylim=c(0,6))
title(main="Depressed Participants", font=2, cex.main=2, line=0)
mtext("Call", 1, font=2, cex=1.5, line=2.25)
mtext("Rating", 2, font=2, cex=1.5, line=2.25)
axis(1, at=c(1:10), font=2, cex.axis=1.25)
axis(2, at=c(0:6), font=2, las=1, cex.axis=1.25)
lines(smooth.spline(x=deprData$Call[deprData$TaskNum == -2], y=deprData$Rating[deprData$TaskNum == -2], spar=0.25), lwd=5, col="blue") 
lines(smooth.spline(x=deprData$Call[deprData$TaskNum == -1], y=deprData$Rating[deprData$TaskNum == -1], spar=0.25), lwd=5, col="green")
lines(smooth.spline(x=deprData$Call[deprData$TaskNum == 0], y=deprData$Rating[deprData$TaskNum == 0], spar=0.25), lwd=5, col="purple")
lines(smooth.spline(x=deprData$Call[deprData$TaskNum == 1], y=deprData$Rating[deprData$TaskNum == 1], spar=0.25), lwd=5, col="red")
lines(smooth.spline(x=deprData$Call[deprData$TaskNum == 2], y=deprData$Rating[deprData$TaskNum == 2], spar=0.25), lwd=5, col="brown")


### Trends in ratings by time2 ###

### Controls ###
plot(NA, xlab="", ylab="", axes=FALSE, xlim=c(1,30), ylim=c(0,6))
mtext("Time Point", 1, font=2, cex=1.5, line=2.25)
mtext("Rating", 2, font=2, cex=1.5, line=2.25)
axis(1, at=seq(1, 29, 4), font=2, cex.axis=1.25)
axis(2, at=c(0:6), font=2, las=1, cex.axis=1.25)
lines(smooth.spline(x=healthyData$Time2[healthyData$TaskNum == -2], y=healthyData$Rating[healthyData$TaskNum == -2], spar=0.25), lwd=5, col="blue") 
lines(smooth.spline(x=healthyData$Time2[healthyData$TaskNum == -1], y=healthyData$Rating[healthyData$TaskNum == -1], spar=0.25), lwd=5, col="green")
lines(smooth.spline(x=healthyData$Time2[healthyData$TaskNum == 0], y=healthyData$Rating[healthyData$TaskNum == 0], spar=0.25), lwd=5, col="purple")
lines(smooth.spline(x=healthyData$Time2[healthyData$TaskNum == 1], y=healthyData$Rating[healthyData$TaskNum == 1], spar=0.25), lwd=5, col="red")
lines(smooth.spline(x=healthyData$Time2[healthyData$TaskNum == 2], y=healthyData$Rating[healthyData$TaskNum == 2], spar=0.25), lwd=5, col="brown")


### Depressed Participants ###
plot(NA, xlab="", ylab="", axes=FALSE, xlim=c(1,30), ylim=c(0,6))
mtext("Time Point", 1, font=2, cex=1.5, line=2.25)
mtext("Rating", 2, font=2, cex=1.5, line=2.25)
axis(1, at=seq(1, 29, 4), font=2, cex.axis=1.25)
axis(2, at=c(0:6), font=2, las=1, cex.axis=1.25)
lines(smooth.spline(x=deprData$Time2[deprData$TaskNum == -2], y=deprData$Rating[deprData$TaskNum == -2], spar=0.25), lwd=5, col="blue") 
lines(smooth.spline(x=deprData$Time2[deprData$TaskNum == -1], y=deprData$Rating[deprData$TaskNum == -1], spar=0.25), lwd=5, col="green")
lines(smooth.spline(x=deprData$Time2[deprData$TaskNum == 0], y=deprData$Rating[deprData$TaskNum == 0], spar=0.25), lwd=5, col="purple")
lines(smooth.spline(x=deprData$Time2[deprData$TaskNum == 1], y=deprData$Rating[deprData$TaskNum == 1], spar=0.25), lwd=5, col="red")
lines(smooth.spline(x=deprData$Time2[deprData$TaskNum == 2], y=deprData$Rating[deprData$TaskNum == 2], spar=0.25), lwd=5, col="brown")
legend(x=-37.5, y=-1.75, x.intersp=0.5, horiz=TRUE, text.font=2, xpd=NA, legend=c("Negative Affect", "Stressfulness", "Unpleasantness", "Pleasantness", "Positive Affect"), fill=c("blue", "green", "purple", "red", "brown"))


dev.off()


