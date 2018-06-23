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
 
  **Ion intensity maps**

 _m/z_ 209.04 <br>
 _m/z_ 273.08 <br>
 _m/z_ 409.22 <br>
 
**2.  180418_POS_Cotton_Leaf_1**

  - [File](LAESI-MSI-Scripts-B_Bartels.et.al/180418_POS_Cotton_Leaf_1/Analog_List.txt) raw analog signal
  - [File](LAESI-MSI-Scripts-B_Bartels.et.al/180418_POS_Cotton_Leaf_1/Corrected_Analog_List.txt) containing corrected analog signal
  - [File](LAESI-MSI-Scripts-B_Bartels.et.al/180418_POS_Cotton_Leaf_1/TIC_List.txt) containing TIC signal extracted based on the corrected analog signal
  - mzXML file generated from the Waters .RAW file
  - nRow = 11, nCol = 11
   
     **Ion intensity maps**

 _m/z_ 147.06 <br>
 _m/z_ 275.13 <br>
 _m/z_ 411.24 <br>
   
