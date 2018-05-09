files = list.files(path="./data/csv",pattern="*.csv")
csvdf = list()
matrixList = list()

for (i in 1:length(files))
{
   csvdf[[i]] = read.csv(paste0("./data/csv/",files[i]))
}

nameVec = c("Dip","Gain",paste0("MatrixGo",seq(1,6)),paste0("MatrixNoGo",seq(1,6)))
dipVec = regmatches(files, regexpr("(?<=p)\\d+\\.\\d+(?=\\s)", files, perl=TRUE))
gainVec = regmatches(files, regexpr("(?<=n)\\d+\\.\\d+(?=\\.)", files, perl=TRUE))

colEnd = ncol(csvdf[[1]])
colStart = colEnd - 11
for (i in 1:length(csvdf))
{
  matrixList[[i]] = csvdf[[i]][50,colStart:colEnd]
}

resultData = data.frame(matrix(ncol=length(nameVec),nrow=length(dipVec)))
colnames(resultData) = nameVec
resultData$Dip = dipVec
resultData$Gain = gainVec

for (i in 1:length(matrixList))
{
  resultData[i,3:ncol(resultData)] = matrixList[[i]]
}

write.csv(resultData,file="resultData.csv")