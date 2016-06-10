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

multipleMissingValueImputation <- function(filePath)
{
  ## Read .csv file
  fileData <-read.csv(filePath, header = FALSE) # Reading csv file with no headers
  fileName <- file_path_sans_ext(basename(filePath)) # Gets the name of the file without extension
  dirPath <- dirname(filePath) # Get the path to the directory
  
  ## Convert the .csv file to matrix class
  dataMatrix <- data.matrix(fileData)
  
  ## Find the number of rows and columns in the matrix
  numberOfRows <- nrow(dataMatrix)
  numberOfColumns <- ncol(dataMatrix)
  
  ## Creates an empty matrix of the same dimensions
  newDataMatrix = matrix(nrow = numberOfRows, ncol = numberOfColumns)
  
  ## missing value counter
  missingValueCount = 1;
  incrementValue = 1;
  
  ## Access each value of the dataMatrix, check if it -10
  for (i in 1:numberOfRows) # for each row
  {
    for (j in 1:numberOfColumns) # for each column
    {
      if (dataMatrix[i,j] == -10) # For single cell missing value
      {
#         if (dataMatrix[i,j + 1] != -10)
#         {
#           # compute missing data by taking the mean of the neighbouring column cells
#           newDataMatrix[i,j] = (dataMatrix[i,j - 1] + dataMatrix[i,j + 1]) /2; 
#         }
#         else
#         {
          k = j;
          while (k > 0)
          {
            if (dataMatrix[i,k + incrementValue] == -10)
            {
              missingValueCount = missingValueCount + 1; # missing value count increases by 1
              incrementValue = incrementValue + 1;
            }
            else
            {
              break;
            }
          }
          cat("Incremenet Value: ", incrementValue, "\n")
          cat("Total consecutive missing values: ", missingValueCount, "at i and j", i, ",", j, "\n")
#        }
        
      }
        else
        {
          newDataMatrix[i,j] = dataMatrix[i,j]; # value remains unchanged for non-missing values
        }
      j = j + incrementValue;
      missingValueCount = 1;
      incrementValue = 1;
    }
  }
    
    ## Generate file name and path where the new matrix wll be written
    outputFilePath = paste(dirPath, "/", fileName,"Imputed.csv", sep = "") # Note: Use forward or backward slash based on OS
    
    ## Write the matrix to the file
    write.table(newDataMatrix, file = outputFilePath, sep = ",", row.names = FALSE, col.names = FALSE)
  }