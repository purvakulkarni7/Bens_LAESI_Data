massFeatures <- function(inputPath)
{
  fileList = list.files(path = inputPath, pattern = "*.txt", full.names = FALSE)
  setwd(inputPath)
  
 # length(massSpectrumObjects[]) <- length(fileList)
  
  massSpectrumObjects <- vector(mode="numeric", length=length(fileList))
  
  # Read all the files one by one
  for (i in 1:length(fileList))
  {
    massSpectrumObjects[i] <- import(fileList[i])
  }
  
  print(length(massSpectrumObjects))
  
  return(massSpectrumObjects)
# averagedSpectra <- averageMassSpectra(massSpectrumObjects, method="mean")
 # return(dim(averagedSpectra))
}