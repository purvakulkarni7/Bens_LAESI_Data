# xlsxToMatrix: This script takes in an excel file with multiple sheets as input. Each sheet contains a single spectrum generated from each coordinate. The script generates a data cube written to a *.xlsx file where the columns represent a spectrum from a coordinate and rows represent the signal intensities for a single mass value over all the coordinates.
# Input: file path (*.xlsx), total number of sheets
# Output: Data cube written to a .xlsx file
#Author: Purva Kulkarni
#Date: 13 October 2016

#######################################################################################################

options(java.parameters = "-Xmx4g")
library(openxlsx) # Very fast for reading large xlsx files

xlsxToMatrix <- function(path, totalSheets)
{
  # Read the first data sheet
  sheetDataFirst <- read.xlsx(path, sheet = 1, colNames = TRUE)
  
  # Create a data.frame using the m/z and intensity coulumns for the first sheet
  result <- cbind(sheetDataFirst$"m/z", sheetDataFirst$Intensity)

  # Read all the sheets one by one and merge the m/z's and add the intensity columns
  for (sheetCounter in 2:totalSheets)
  {
    sheetDataNext <- read.xlsx(path, sheet = sheetCounter, colNames = TRUE)
    dfNext <- cbind(sheetDataNext$"m/z", sheetDataNext$Intensity)
    result <- merge(result, dfNext, by = "V1", all = TRUE)
   
  }
  
  # Replace any NA present in the data.frame with zero
  result[is.na(result)] <- 0
  
  # Extract the mz list which is the first column and create a mzList object, write it into a *.xlsx file
  mzList <- result[1]
  write.xlsx(mzList, "mzList.xlsx")
  
  # Write the data.frame to a file
  write.xlsx(result, "mergedMatrix.xlsx")
}
