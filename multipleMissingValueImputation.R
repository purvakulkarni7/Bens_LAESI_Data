#' This function is a basic mean based imputation function to calculate values for missing data
#'
#' @title multipleMissingValueImputation.R
#' @param filePath (format *.csv)
#' @return Generates a new matrix with values for missing data and writes it to a *.csv file. The script supports rows with consecutive missing values.

## Note: The missing values in this dataset(150x210_Offset00x00_Step0_1_bigfly.csv) are marked using -10

## Date 10 June 2016
## Author: Purva Kulkarni

library(tools) # unless already loaded, comes with base R

multipleMissingValueImputation <- function(filePath)
{
  ## Read .csv file
  fileData <-read.csv(filePath, header = FALSE) # Reading csv file with no headers
  fileName <- file_path_sans_ext(basename(filePath)) # Gets the name of the file without extension
  dirPath <- dirname(filePath) # Get the path to the directory
  
  ## Convert the .csv file to matrix class
  mdata <- data.matrix(fileData)
  
  ## Counters initialized
  val = 1;
  counter = 1;
  temp = matrix();
  
  for (i in 1:nrow(mdata)) # Loop for traversing rows
  {
    for (j in 1:ncol(mdata)) # Loop for traversing columns
    {
      if (class(mdata[i,j]) != "numeric") # Check if the cell value os numeric
      {
        mdata[i,j] = as.numeric(as.vector(mdata[i,j])); # Convert to numeric if of any other type
      }  
      
      ## Access each value of the dataMatrix, check if it -10
      if (mdata[i,j] == -10)
      {
        while (j <= ncol(mdata))
        {
          if (mdata[i,j + val] == -10) # Counters for missing value
          {
            counter = counter + 1;
            val = val + 1;
            next;                    
          }
          else
          {
            break;
          }
        }
        
        if (counter == 1) # When there is a single missing value
        {
          temp <- t(as.matrix(mdata[i, (j - 1):(j + 1)])); # Store the missing value and its neighbours in a temp matrix
          to.avg <- c(temp[,1], temp[,3]);
          avg<-mean(to.avg); # Take an average 
          mdata[i,j] = avg; # Substitute average in missing value cell
        }
        else
        {
          temp <- t(as.matrix(mdata[i,(j - 1):(j + counter)]));
          for (k in 0:(counter-1)) # Loop for consecutive missing values
          {
            to.avg <- c(temp[,(k+1)], temp[,length(temp)]);
            avg<-mean(to.avg)
            temp[,(k+2)] = avg; # perform averaging in a consecutive manner
            mdata[i,j+k]=avg; 
          }
        }
      }
      else
      {
        mdata[i,j] = as.numeric(as.vector(mdata[i,j])); # Value remains intact if not -10
      }
      val = 1;
      counter = 1;
    }
  }
  
  ## Generate file name and path where the new matrix wll be written
  outputFilePath = paste(dirPath, "/", fileName,"Imputed.csv", sep = "") 
  # Note: Use forward or backward slash based on OS
  
  ## Write the matrix to the file
  write.table(mdata, file = outputFilePath, sep = ",", row.names = FALSE, col.names = FALSE)
}