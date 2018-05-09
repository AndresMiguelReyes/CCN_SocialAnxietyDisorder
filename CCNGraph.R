library(ggplot2)

graphDF = data.frame(matrix(ncol=8,nrow=nrow(resultData)))
colnames(graphDF) = c("Dip","Burst",paste0("MatrixDiff",seq(1,6)))
graphDF$Dip = as.double(resultData$Dip)
graphDF$Burst = as.double(resultData$Gain)
graphDF[,3:8] = abs(resultData[,3:8]-resultData[,9:14])

val = 1.0
x = graphDF[(graphDF$Dip == val),2]
y = 1/graphDF[(graphDF$Dip == val),5]

titleStr = paste0("Conflict with normal D2 receptor bindings\n on 60% reward action")
xLab = "D1 receptor binding %"
yLab = "Conflict\n(1/abs. diff.)"

ggDF = data.frame(matrix(ncol=2,nrow=length(x)))
ggDF[,1] = x
ggDF[,2] = y

p <- ggplot(data=ggDF, aes(x=x, y=y, group=1)) + geom_line() + geom_point()
p + xlab(xLab) + ylab(yLab) + labs(title=titleStr)