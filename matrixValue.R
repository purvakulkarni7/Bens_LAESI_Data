#' This function is a basic function to calucalte matrixValues
#'
#' @title matrixValue.R
#' @param filePath (format *.csv)
#' @param a
#' @param b
#' @param stepSize
#' @return Generates a new matrix with modified values

## Date 9 May 2016
## Author: Purva Kulkarni
## Time: 14:55

if (!require("gplots")) {
  install.packages("gplots", dependencies = TRUE)
  library(gplots)
}
if (!require("RColorBrewer")) {
  install.packages("RColorBrewer", dependencies = TRUE)
  library(RColorBrewer)
}
if (!require("viridis")) {
  install.packages("viridis", dependencies = TRUE)
  library(viridis)
}

library(tools) # unless already loaded, comes with base R


matrixValue <- function(filePath)
{
  ## Assign the values of a, b and stepsize
  a = -0.00868;
  b = 0.011169;
  stepSize = 0.01;
  
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
  
  ## Set newColumnStepSize as zero
  newRowStepSize = 0;
  value = 0;
  
  ## Access each value of the dataMatrix and compute new value
  for (i in 1:numberOfRows)
    # for each row
  {
    for (j in 1:numberOfColumns)
      # for each column
    {
      print(dataMatrix[i,j])
      newDataMatrix[i,j] = (dataMatrix[i,j] - (a * value) - (b * newRowStepSize)); # compute values for the new matrix
      value = value + stepSize;
    }
    newRowStepSize = newRowStepSize + stepSize;
    value = 0;
  }
  
  ## Generate file name and path where the new matrix wll be written
  outputFilePath = paste(dirPath, "/", fileName,"Modified.csv", sep = "") # Note: Use forward or backward slash based on OS
  
  ## Write the matrix to the file
  write.table(newDataMatrix, file = outputFilePath, sep = ",", row.names = FALSE, col.names = FALSE)
  
  # Generate file name and path where the heatmap will be stored
  outputImagePath = paste(dirPath, "/", fileName,"Image.png", sep = "") # Note: Use forward or backward slash based on OS
  
  png(outputImagePath,    
      width = 20*100,        # 5 x 300 pixels
      height = 20*100,
      res = 100)            # 300 pixels per inch
  
  heatmap.2(newDataMatrix,
            density.info="none",  # turns off density plot inside color legend
            trace="none",         # turns off trace lines inside the heat map
            margins =c(9,9),      # widens margins around plot
            col=viridis(10000),   # use on color palette defined earlier 
            dendrogram="none",
            Rowv="NA",            # turn off row clustering
            Colv="NA")            # turn off column clustering
  dev.off()               # close the PNG device
}