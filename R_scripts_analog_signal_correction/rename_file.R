# Rename the *.csv file list exported by Proteoplot to a new name in *.txt format
# Input file name pattern: spectrum export (2).csv
# Output file name pattern: 2.txt
# Note: This will chunk of code will not work for the first file spectrum export.csv, so make sure to rename the file to spectrum export (1).csv
# Input parameters: Path to the directory where the files are present

rename_file <- function(path)
{
  setwd(path)
  totalFiles <- list.files(path,pattern = "spectrum*")
  
  for (i in 1: length(totalFiles))
  {
         tempString <- gsub("spectrum\\sexport\\s\\W", "", totalFiles[i])
         tempString1 <- strsplit(tempString, ")")
         file.rename(totalFiles[i], paste0(tempString1[[1]][1],".txt"))
  }
}