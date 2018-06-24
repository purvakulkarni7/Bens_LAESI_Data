#' extract_mass_spectra_mzXML.R
#' This function reads an mzXML corresposnding to the RAW data from which the analog and the TIC lists have been extracted and then extracts spectra based on the rentention time points provided in the TIC list. 
#'                                                      
#' @param mzXMLData object of class list containing mass spectrum objects extracted from a mzXML file (use function importMzXml() to generate this object)
#'
#' @param TICTimeList An object of class list that contains the extracted TIC time points 
#' 
#' @return massSpectrumObjectList A list class object with mass spectrum objects corresponding to the coordinates in a data file
#' 
#' @Note: In the mzXML file that is being read by MALDIQuant, the retention time is provided in seconds. Whereas in the TIC list/ analog list it is provided in minutes. Make the conversion from seconds to minutes. 
#'
#' @author Purva Kulkarni
#' 

library(MALDIquant)
library(MALDIquantForeign)

# Start of function
extract_mass_spectra_mzXML <- function(mzXMLData, TICTimeList)
{
  
  # mzXMLData <- importMzXml(filePath)
  massSpectrumObjectList = list() # List contains averaged MS objects each object belonging to a single coordinate position
  counter = 1;
  
  #From the TIC list read each entry of tStartTIC and tEndTIC
  for(i in 1:length(TICTimeList))
  {
    tStartTIC = TICTimeList[[i]]$tStartTIC
    tEndTIC = TICTimeList[[i]]$tEndTIC
   # print(paste("tStart: ", tStartTIC, "tEnd: ", tEndTIC))
    
    MSObjectList = list() # List contains indididual MS objects arising from a single coordinate position before averaging
    
    listCounter = 1;
    
    # Run for loop on the mzXML data to extarct spectra belonging between the TIC time points
    for(j in 1:length(mzXMLData))
    {
      t = j
      mzXMLtimeValue = round((metaData(mzXMLData[[t]])$retentionTime)/60, 3)
      
      # tStartTIC condition
      # The if condition finds the mzXMLtimeValue that is excatly equal to the tStartTIC or has a difference of 0.001 to the tStartTIC value (as observed in this dataset - Hylemonella Mono d10 for several scans)
      # For example - Time point 17.244 min was 17.245 min (1034.67 sec) in the mzXML file
      # NOTE: This condition may not apply for all the datasets
      
      if((tStartTIC == mzXMLtimeValue) || isTRUE((all.equal(abs(tStartTIC-mzXMLtimeValue),0.001) )))
      {
        # tEndTIC while loop
        while(round((metaData(mzXMLData[[t]])$retentionTime)/60, 3) <= tEndTIC)
        {
          MSObjectList[[listCounter]] = mzXMLData[[t]]
          listCounter = listCounter + 1;
          t = t+1;
        }
        # Average the mass spectra that lie between the tStartTIC and tEndTIC
        averagedSpectra <- averageMassSpectra(MSObjectList, method = "mean")
        massSpectrumObjectList[[counter]] <- averagedSpectra
        counter = counter +1;
      }
      
    }
  }
  # This list object contains averaged mass spectra for each time point belonging to the analog signal in the TIC list
  # The length of the TICList, AnalogList and the massSpectrumObjectList should be identical
  return(massSpectrumObjectList)
}