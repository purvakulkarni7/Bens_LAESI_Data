#' read_analog.R
#' This function reads extracted analog signal from a text file and extracts a list of time point clusters that have intensity (in mV) highher than 2% of the maximum intensity
#'                                                      
#' @param filePath path to the text file that contains the analog signal. This file should contain two columns without a header, time points and their respective intensity
#'
#' @return An object of list class with total number of analog signal clusters, with their start time, start position in the analog signal list, end time, end position in the analog signal list and the cluster number 
#'
#' @author Purva Kulkarni

# Start of function
read_analog <- function (filePath)
{
  # Read file data
  analogData <- read.table(filePath)
  
  # Calculate two percent of maximum intensity height 
  twoPercentHeight <- (max(analogData$V2)*2/100)
  counter = 0
  analogSignalList = list()
  whileCounter = 0
  i=1
  
  # Start a while loop to travserse the list
  while(i < nrow(analogData)-1)
  {
    # Signal should be atleat 2% of the maximum peak height
    # Example: if the maximum peak height is 2250 then the minimum signal to be considered should be atleast 45
    
    if(analogData$V2[i] >= twoPercentHeight)
    {
      counter = counter + 1
      tStart <- analogData$V1[i]
      positionStart <- i
      whileCounter = 0
      
      # Enter the while loop until the peak height is lower than the two percent of maximum height
      while (analogData$V2[i] >= twoPercentHeight)
      {
        i=i+1
        whileCounter = whileCounter+1
      }
      
      tEnd <- analogData$V1[i-1]
      positionEnd <- i-1
      
      # Create a dataframe to enter the tStart, positionStart, tEnd, positionEnd
      timeDataFrame <- data.frame(tStart,positionStart, tEnd, positionEnd, counter)
      
      # Append dataframe in the list
      analogSignalList[[counter]] <- timeDataFrame
      next
    }
    else
    {
      i = i + 1
      next
    }
  }
  
  # Return the list object
  return(analogSignalList)
}