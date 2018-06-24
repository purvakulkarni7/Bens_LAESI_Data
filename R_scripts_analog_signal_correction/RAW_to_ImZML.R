#' RAW_to_ImZML.R
#' This function takes multiple user input on the console prompt and generates imZML files from mzXML files, based on the total number of replicates present. The imzML files are written in processed format.
#'  
#' Note: No input is needed in the form of function arguments. The function would prompt for the following input when executed.                                                                                                          
#' @param sampleName Name of the sample for which conversion is to be performed
#'
#' @param analogDataPath Path to the *.txt file containing the analog data exported from MassLynx 
#' 
#' @param TICDataPath Path to the *.txt file containing the TIC data exported from MassLynx 
#' 
#' @param mzXMLDataPath Path to the *.mzXML file that was generated after conversion from .RAW using massWolf
#' 
#' @param nRow image row dimensions for a single replicate
#' 
#' @param nCol image column dimensions for a single replicate
#' 
#' @param numberOfReplicates Total number of replicates present in a single acquired file     
#' 
#' @return The function writes imzML files corresponding to the number of replicates provided in the current working directory. The imzML files are written in processed format.
#'
#' @author Purva Kulkarni
#' 
#' 
source("read_analog.R")
source("read_TIC.R")
source("extract_mass_spectra_mzXML.R")
source("massObjects_To_imzML.R")

library("MALDIquant")
library("MALDIquantForeign")

RAW_to_ImZML <- function(){
  # Promt for the sample name
  sampleName <- readline(prompt="Enter sample name (without spaces, example: HylemonellaMono): ")
  
  # Prompt for path to analog data file
  analogDataPath <- readline(prompt="Enter path for analog data file (*.txt): ")
  
  # Prompt for path to TIC data file
  TICDataPath <- readline(prompt="Enter path for TIC data file (*.txt): ")
  
  # Prompt for path to mzXML file
  mzXMLDataPath <- readline(prompt="Enter path for mzXML data file (*.mzXML): ")
  
  # Prompt for number of rows in a single replicate acquisition
  nRow <- readline(prompt="Enter the number of rows for a single replicate acquisition (integer): ")
  
  # Prompt for number of columns in a single replicate acquisition
  nCol <- readline(prompt="Enter the number of columns for a single replicate acquisition (integer): ")
  
  # Prompt for the number of replicates
  numberOfReplicates <- readline(prompt="Enter the number of replicates on the plate for a single acquisition(integer): ")
  
  # Create analog list variable
  print("Reading analog data...")
  analogList <- read_analog(analogDataPath)
  
  # Create TIC list variable
  print("Reading TIC data...")
  TICList <- read_TIC(TICDataPath, analogList)
  
  # Read mzXML file and create mzXML object
  print("Importing data from mzXML file...")
  mzXMLData <- importMzXml(mzXMLDataPath)
  
  # Extract mass spectra from the mzXML file corresponding to the TIC list
  print("Extracting mass spectra from mzXML file...")
  massSpectrumObjectList <- extract_mass_spectra_mzXML(mzXMLData,TICList)
  
  # Convert the acquired spectra to imzML files
  massObjects_To_imzML(massSpectrumObjectList, as.numeric(nCol), as.numeric(nRow), as.numeric(numberOfReplicates), sampleName)
  
  print("Successful run! The script will terminate now.")
}

