# Analog time correction #

Dataset used to generate time-shift correction function: 180607_POS_LeuEnk_timeshift_3.raw <br>
Deatils related to the function and its calulation can be found in this file: [180607_LeuEnk_Timeshift_offset.xls](LAESI-MSI-Scripts-B_Bartels.et.al/180607_LeuEnk_Timeshift_offset.xls)

**Analog time correction function:** 
````
y = 0.0092x - 0.0047
````
## Datasets used to test the analog time correction function ##

 **1.  180418_NEG_Cotton_Leaf_1**
 
   - [File](LAESI-MSI-Scripts-B_Bartels.et.al/180418_NEG_Cotton_Leaf_1/Analog_List.txt) raw analog signal
   - [File](LAESI-MSI-Scripts-B_Bartels.et.al/180418_NEG_Cotton_Leaf_1/Corrected_Analog_List.txt) containing corrected analog signal
   - [File](LAESI-MSI-Scripts-B_Bartels.et.al/180418_NEG_Cotton_Leaf_1/TIC_List.txt) containing TIC signal extracted based on the corrected analog signal
   - mzXML file generated from the Waters .RAW file
   - nRow = 11, nCol = 11
 
 Run the `RAW_to_ImzML.R` script to generate the imzML file
 ````
 > RAW_to_ImZML()
Enter sample name (without spaces, example: HylemonellaMono): 180418_NEG_Cotton_Leaf_1
Enter path for analog data file (*.txt): P:\Personal\Personal_Scientific\Ben_LAESI_Data_4_June_2018\180418_NEG_Cotton_Leaf_1\Corrected_Analog_List.txt
Enter path for TIC data file (*.txt): P:\Personal\Personal_Scientific\Ben_LAESI_Data_4_June_2018\180418_NEG_Cotton_Leaf_1\TIC_List.txt
Enter path for mzXML data file (*.mzXML): P:\Personal\Personal_Scientific\Ben_LAESI_Data_4_June_2018\180418_NEG_Cotton_Leaf_1\180418_NEG_Cotton_Leaf_1.mzXML
Enter the number of rows for a single replicate acquisition (integer): 11
Enter the number of columns for a single replicate acquisition (integer): 11
Enter the number of replicates on the plate for a single acquisition(integer): 
 ````
 
  **Ion intensity maps**

 _m/z_ 209.04 <br>
 _m/z_ 273.08 <br>
 _m/z_ 409.22 <br>
 
 ---
 
**2.  180418_POS_Cotton_Leaf_1**

  - [File](LAESI-MSI-Scripts-B_Bartels.et.al/180418_POS_Cotton_Leaf_1/Analog_List.txt) raw analog signal
  - [File](LAESI-MSI-Scripts-B_Bartels.et.al/180418_POS_Cotton_Leaf_1/Corrected_Analog_List.txt) containing corrected analog signal
  - [File](LAESI-MSI-Scripts-B_Bartels.et.al/180418_POS_Cotton_Leaf_1/TIC_List.txt) containing TIC signal extracted based on the corrected analog signal
   - mzXML file generated from the Waters .RAW file
   - nRow = 11, nCol = 11
   
    Run the `RAW_to_ImzML.R` script to generate the imzML file
   ````
   > RAW_to_ImZML()
Enter sample name (without spaces, example: HylemonellaMono): 180418_POS_Cotton_Leaf_1
Enter path for analog data file (*.txt): P:\Personal\Personal_Scientific\Ben_LAESI_Data_4_June_2018\180418_POS_Cotton_Leaf_1\Corrected_Analog_List.txt
Enter path for TIC data file (*.txt): P:\Personal\Personal_Scientific\Ben_LAESI_Data_4_June_2018\180418_POS_Cotton_Leaf_1\TIC_List.txt
Enter path for mzXML data file (*.mzXML): P:\Personal\Personal_Scientific\Ben_LAESI_Data_4_June_2018\180418_POS_Cotton_Leaf_1\180418_POS_Cotton_Leaf_1.mzXML
Enter the number of rows for a single replicate acquisition (integer): 11
Enter the number of columns for a single replicate acquisition (integer): 11
Enter the number of replicates on the plate for a single acquisition(integer): 1
   ````
   
 **Ion intensity maps**

 _m/z_ 147.06 <br>
 _m/z_ 275.13 <br>
 _m/z_ 411.24 <br>
   
