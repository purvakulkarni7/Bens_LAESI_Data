#' This function is a basic mean based imputation function to calculate values for missing data
#'
#' @title multipleMissingValueImputation.R
#' @param filePath (format *.csv)
#' @return Generates a new matrix with values for missing data and writes it to a *.csv file. The script supports rows with consecutive missing values.

## Note: The missing values in this dataset(150x210_Offset00x00_Step0_1_bigfly.csv) are marked using -10

## Date 10 June 2016
## Author: Purva Kulkarni
## Time: 13:35

library(tools) # unless already loaded, comes with base R

#' Title
#'
#' @param filePath
#'
#' @return
#' @export
#'
#' @examples
multipleMissingValueImputation <- function(filePath)
{
  ## Read .csv file
  fileData <-
    read.xlsx(filePath, 1, header = FALSE, sep = ",") # Reading csv file with no headers
  fileName <-
    file_path_sans_ext(basename(filePath)) # Gets the name of the file without extension
  dirPath <- dirname(filePath) # Get the path to the directory
  
  ## Convert the .csv file to matrix class
  dataMatrix <- data.matrix(fileData)
  
  ## Find the number of rows and columns in the matrix
  numberOfRows <- nrow(dataMatrix)
  numberOfColumns <- ncol(dataMatrix)
  
  ## Creates an empty matrix of the same dimensions
  newDataMatrix = matrix(nrow = numberOfRows, ncol = numberOfColumns)
  
  ## Access each value of the dataMatrix, check if it -10
  for (i in 1:numberOfRows)  # for each row
  {
    missingValueList = which(dataMatrix[i,] == -10);
    consecutiveBreaks = which(diff(missingValueList) != 1);
    print(missingValueList)
    print(consecutiveBreaks)
    
    j=0;
    
    for(k in 1:length(consecutiveBreaks))
    {
      if(k == 1)
      {
        cat(consecutiveBreaks[k], " missing value at: (",i,",",missingValueList[j+k],")","\n");
      }
      else
      {
        cat("Value of k: ", k, "\n");
        cat(abs(consecutiveBreaks[k]-consecutiveBreaks[k-1]), " missing values starting from: (",i,",",missingValueList[j],")","\n");
        
      }
      j=j+1;
    }
  }
    
#     for(k in 1:(length(missingValueList)-1))
#     {
#       if(abs(missingValueList[k] - missingValueList[k+1]) > 1) #not consecutive
#       {
#         j = missingValueList[k];
#         cat("Single missing value at: (",i,",",j,")","\n");
#       }
#       else #consecutive values
#       {
#         j = missingValueList[k];
#         cat("Consecutive values at: (",i,",",j,") and (",i,",",j+1,")","\n");
#       }
#     }
#       j = missingValueList[length(missingValueList)];
#       cat("Single missing value at: (",i,",",j,")","\n");
#  }

  
  ## Generate file name and path where the new matrix wll be written
  outputFilePath = paste(dirPath, "/", fileName,"Imputed.csv", sep = "")
  # Note: Use forward or backward slash based on OS
  
  ## Write the matrix to the file
  write.table(
    newDataMatrix, file = outputFilePath, sep = ",", row.names = FALSE, col.names = FALSE
  )
}