read_TIC_NEW <- function (filePath, analogScanList)
{
  # Read file data
  TICData <- read.table(filePath)
  
  counter = 0
  TICSignalList = list()
  whileCounter = 0
  i=1
  j=1
  
  while((i < nrow(TICData)-1) && (j <= length(analogScanList)))
  {
    positionStartTIC <- round(((-1)*(10^(-11))*(analogScanList[[j]]$positionStart^2))+(0.18456*analogScanList[[j]]$positionStart)-0.3404) 
    positionEndTIC <- positionStartTIC + 7
    
    print(paste(positionStartTIC, "and", positionEndTIC))
    
    counter = counter + 1
    j=j+1
    
    tStartTIC <- TICData[positionStartTIC,1]
    tEndTIC <- TICData[positionEndTIC,1]
    
    timeDataFrameTIC <- data.frame(tStartTIC,positionStartTIC, tEndTIC, positionEndTIC, counter)
    
    TICSignalList[[counter]] <- timeDataFrameTIC
  }
  
  # Return the list object
  return(TICSignalList)
}
