#' analog_time_difference.R
#' This function take the analogList (generated using the function read_analog.R) contianing time points as an input and calculates the difference between each consecutive time point. 
#'                                                      
#' @param analogTimeList An object of list class with total number of analog signal clusters, with their start time, start position in the analog signal list, end time, end position in the analog signal list and the cluster number 
#'
#' @return An object with the time difference values 
#'
#' @author Purva Kulkarni

# Start of function
analog_time_difference <- function (analogTimeList)
{
  i =1
  timeDifferenceList <- matrix(, nrow = (length(analogTimeList)-1), ncol = 1)
  
  while(i < length(analogTimeList))
  {
    timeDifferenceList[i] = (analogTimeList[[i+1]]$tStart - analogTimeList[[i]]$tEnd)
    i = i+1
  }
  
  return(timeDifferenceList)
}