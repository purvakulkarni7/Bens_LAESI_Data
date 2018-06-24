#' massObjects_To_imzML.R
#' This function take the massObjectList (generated using the function extract_spectra_mzXML.R), the replicate coordinates, number of replicates and a filename to return a list containging izML files. Each imzML file in this list corresponds to one replicate in the aquired dataset. The imzML files are written in processed format. To export them in continuous format; in the command exportImzMl(replicateObjectList[[i]], fileName, processed = TRUE, coordinates = coordinateMatrix, force = TRUE) change processed = FALSE. 
#' 
#' @Note: This code is specifically designed for samples where multiple replicates have been measured by placing side-by-side on a LAESI imaging target plate
#'                                                      
#' @param massObjectList An object of list class. This list contains massSpectrum objects that correspond to individual coordinate positions in the acquired sample (Acquired using extract_spectra_mzXML.R)
#' 
#' @param nCol An intger value equalivalent to the number of columns in an individual replicate acquition
#' 
#' @param nRow An intger value equalivalent to the number of rows in an individual replicate acquition
#' 
#' @param numberOfReplicates An integer 
#' 
#' @param newFileName A string with the file name that will be used for the imzML file generated
#' 
#' @export imzMLfiles equivalent to the number of replicates provided 
#'
#' @author Purva Kulkarni

massObjects_To_imzML <- function(massObjectList, nCol, nRow, numberOfReplicates, newFileName)
{
  coordinatesPerReplicate <- nCol * nRow
  replicateObjectList = list()
 
 for(i in 1:numberOfReplicates)
 {
   if(i ==1)
   {
      replicateObjectList[[i]] = massObjectList[1:(coordinatesPerReplicate * i)]
   }
   else
   {
     replicateObjectList[[i]] = massObjectList[(1+(coordinatesPerReplicate * (i-1))):(coordinatesPerReplicate * i)]
   }
 }
  
  # Create an empty matrix to fill in the coordinate positions
  coordinateMatrix <- matrix(, nrow = coordinatesPerReplicate, ncol = 2)
  counter = 1 #counter to populate empty matrix in linear fashion
  
  # Outer loop to iterate over the rows with values
  for(j in 1:nRow)
  {
    b=0
    for(i in 1:nCol) # Inner loop to iterate over the columns
    {
      # counter fills column 1 of empty matrix
      # b fills column 2 of emoty matrix
      coordinateMatrix[counter,1] <- j
      coordinateMatrix[counter,2] <- b+1
      b = b+1
      counter = counter + 1
    }
  }

  # Export individual replicateObjectList objects to imzML file
  # For coordinates its always row* column (example: 8 *9)
  
  for (i in 1:numberOfReplicates)
  {
    fileName = paste(newFileName, "_Replicate_",i,".imzML",sep ="")
    print(paste("Generating imzML file for replicate", i, "..."))
    exportImzMl(replicateObjectList[[i]], fileName, processed = TRUE, coordinates = coordinateMatrix, force = TRUE)

  }
}