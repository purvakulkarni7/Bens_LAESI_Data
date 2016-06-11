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
    read.csv(filePath, header = FALSE) # Reading csv file with no headers
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
  
  ## missing value counter
  missingValueCount = 0;
  incrementValue = 1;
  
  ## Access each value of the dataMatrix, check if it -10
  for (i in 1:numberOfRows)  # for each row
  {
    for (j in 1:numberOfColumns) # for each column
    {
      k = j;
      if (dataMatrix[i,j] == -10)  # For single cell missing value
      {
        cat("value of j ABOVE HERE is: ", j, "\n")
        cat(
          "I got a single missing value at (",i,",",j,". Is there a consecutive missing value?", "\n"
        )
        for (k in j:numberOfColumns)
        {
          if (dataMatrix[i,k + incrementValue] == -10)
          {
            cat("Yes there is.", "\n")
            missingValueCount = missingValueCount + 1; # missing value count increases by 1
            incrementValue = incrementValue + 1;
          }
          else
          {
            cat("No there is no consecutive value.","\n")
            break;
          }
        }
        cat("Mising values here: ", missingValueCount, "\n")
        next;
      }
      else
      {
        newDataMatrix[i,j] = dataMatrix[i,j]; # value remains unchanged for non-missing values
      }
      missingValueCount = 0;
      incrementValue = 1;
      next;
    }
  }
  
  ## Generate file name and path where the new matrix wll be written
  outputFilePath = paste(dirPath, "/", fileName,"Imputed.csv", sep = "")
  # Note: Use forward or backward slash based on OS
  
  ## Write the matrix to the file
  write.table(
    newDataMatrix, file = outputFilePath, sep = ",", row.names = FALSE, col.names = FALSE
  )
}