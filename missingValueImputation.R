#' This function is a basic mean based imputation function to calculate values for missing data
#'
#' @title missingValueImputation.R
#' @param filePath (format *.csv)
#' @return Generates a new matrix with values for missing data and writes it to a *.csv file

## Note: The missing values in this dataset(150x210_Offset00x00_Step0_1_bigfly.csv) are marked using -10 

## Date 24 May 2016
## Author: Purva Kulkarni
## Time: 16:33

library(tools) # unless already loaded, comes with base R

missingValueImputation <- function(filePath)
{
  ## Read .csv file
  fileData <- read.csv(filePath, header = FALSE) # Reading csv file with no headers
  fileName <- file_path_sans_ext(basename(filePath)) # Gets the name of the file without extension
  dirPath <- dirname(filePath) # Get the path to the directory
  
  ## Convert the .csv file to matrix class
  dataMatrix <- data.matrix(fileData)
  
  ## Find the number of rows and columns in the matrix
  numberOfRows <- nrow(dataMatrix)
  numberOfColumns <- ncol(dataMatrix)
  
  ## Creates an empty matrix of the same dimensions
  newDataMatrix = matrix(nrow = numberOfRows, ncol = numberOfColumns)
  
  ## Access each value of the dataMatrix, check if it -10
  for (i in 1:numberOfRows)
    # for each row
  {
    for (j in 1:numberOfColumns)
      # for each column
    {
      print(dataMatrix[i,j])
      if(dataMatrix[i,j] == -10){
        # compute missing data by taking the mean of the neighbouring column cells
        newDataMatrix[i,j] = (dataMatrix[i,j-1] + dataMatrix[i,j+1])/2;
      }
     else
       newDataMatrix[i,j] = dataMatrix[i,j]; # value remains unchanged for non-missing values
    }
  }
  
  ## Generate file name and path where the new matrix wll be written
  outputFilePath = paste(dirPath, "/", fileName,"Imputed.csv", sep = "") # Note: Use forward or backward slash based on OS
  
  ## Write the matrix to the file
  write.table(newDataMatrix, file = outputFilePath, sep = ",", row.names = FALSE, col.names = FALSE)
}