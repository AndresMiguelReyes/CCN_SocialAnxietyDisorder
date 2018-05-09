library(ggplot2)

searchParam = function(burst,dip)
{
  resultData = read.csv("resultData.csv")
  resultData = resultData[,-1]
  resultData = resultData[resultData[,2] == burst,]
  resultData = resultData[resultData[,1] == dip,]
  return(resultData)  
}

formatData = function(data)
{
  typeVec = c(rep("MatrixGo",6),rep("MatrixNoGo",6))
  actVec = rep(paste0(c("100%","80%","60%","40%","20%","0%")," reward"),2)
  valVec = as.numeric(data[3:length(data)])
  
  newdf = data.frame(matrix(ncol=3,nrow=length(valVec)))
  colnames(newdf) = c("layer","action","average")
  newdf$layer = typeVec
  newdf$action = actVec
  newdf[,3] = valVec
  return(newdf)
}

burst=1.5
dip=1.5
ggplot(formatData(searchParam(burst,dip)), aes(action, average)) + geom_bar(aes(fill = layer),width = 0.8, position = position_dodge(), stat="identity")