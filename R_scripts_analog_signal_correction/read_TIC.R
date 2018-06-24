#' read_TIC.R
#' This function reads extracted TIC signal from a text file and extracts a list of time point clusters that have time points between those extracted within the analog signal list
#'                                                      
#' @param filePath path to the text file that contains the TIC signal. This file should contain two columns without a header, time points and their respective intensity
#'
#' @param analogTimeList An object of list class with total number of analog signal clusters, with their start time, start position in the analog signal list, end time, end position in the analog signal list and the cluster number 
#' 
#' @return An object of list class with total number of TIC signal clusters, with their start time, start position in the TIC signal list, end time, end position in the TIC signal list and the cluster number 
#'
#' @author Purva Kulkarni

# Start of function
read_TIC <- function (filePath, analogTimeList)
{
  # Read file data
  TICData <- read.table(filePath)
  
  counter = 0
  TICSignalList = list()
  whileCounter = 0
  i=1
  j=1
  
  while((i < nrow(TICData)-1) && (j <= length(analogTimeList)))
  {
    startTime <- analogTimeList[[j]]$tStart
    endTime <- analogTimeList[[j]]$tEnd
    
    # In the first column of the TIC, select the time point cluster which has a TIC startTime equal to or more than the startTime in the analog list and a TIC endTime less than or equal to the endTime in the analog list
    # Exmaple: Analog list entry
    # tStart positionStart  tEnd positionEnd counter
    # 1  1.008           122 1.083         131       1
    # Selection of time point cluster in TICData
    # 1.04	12036925
    # 1.057	12438266
    # 1.074	12516483
    
    if(TICData$V1[i] >= startTime)
    {
      counter = counter + 1
      tStartTIC <- TICData$V1[i]
      positionStartTIC <- i
      whileCounter = 0
      
      while (TICData$V1[i] <= endTime)
      {
        i=i+1
        whileCounter = whileCounter+1
      }
      
      tEndTIC <- TICData$V1[i-1]
      positionEndTIC <- i-1
      
      # Create a dataframe to enter the tStart, positionStart, tEnd, positionEnd
      timeDataFrameTIC <- data.frame(tStartTIC,positionStartTIC, tEndTIC, positionEndTIC, counter)
      
      # Append dataframe in the list
      TICSignalList[[counter]] <- timeDataFrameTIC
      
      j=j+1
      next
    }
    else
    {
      i = i + 1
      next
    }
    
  }  
  
  # Return the list object
  return(TICSignalList)
  
}