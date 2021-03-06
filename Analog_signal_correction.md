# Analog time correction #

Dataset used to generate time-shift correction function: 180607_POS_LeuEnk_timeshift_3.raw (_m/z_ 556.28) <br>
Deatils related to the function and its calulation can be found in this file: [180607_LeuEnk_Timeshift_offset.xls](LAESI-MSI-Scripts-B_Bartels.et.al/180607_LeuEnk_Timeshift_offset.xls)

**Analog time correction function:** 
````
y = 0.0092x - 0.0047
````

[Link](/R_scripts_analog_signal_correction/) to R scripts for analog signal correction and generation of imzML file

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
Enter the number of replicates on the plate for a single acquisition(integer): 1
 ````
 
  **Ion intensity maps**

**_m/z_ 209.04**
````
mz209_NEG <- plotMsiSlice(NEG_Cotton_Leaf_1, center = 209.04, tolerance = 0.1, colRamp=viridis_col)
````
![](/Ion_maps/209_04_NEG.png)
Ion map from Cardinal (Continuous imzML file)
![](/Ion_maps/209_045_NEG_Continuos_Cardinal.png)

Ion map transposed (Processed imzML file, plotIMSSlice.R script)
````
plotIMSSlice(Cotton_Leaf_NEG, c(208.94, 209.14), main = "")
````
![](/Ion_maps/209_04_NEG_Processed_Transposed.png)

 **_m/z_ 273.08**
````
mz273_NEG <- plotMsiSlice(NEG_Cotton_Leaf_1, center = 273.08, tolerance = 0.1, colRamp=viridis_col)
````
![](/Ion_maps/273_08_NEG.png)
Ion map from Cardinal (Continuous imzML file)
![](/Ion_maps/273_085_NEG_Continuos_Cardinal.png)
Ion map transposed (Processed imzML file, plotIMSSlice.R script)
````
plotIMSSlice(Cotton_Leaf_NEG, c(272.98, 273.18), main = "")
````
![](/Ion_maps/273_08_NEG_Processed_Transposed.png)
**_m/z_ 409.22**
````
mz409_NEG <- plotMsiSlice(NEG_Cotton_Leaf_1, center = 409.22, tolerance = 0.1, colRamp=viridis_col)
````
 ![](/Ion_maps/409_22_NEG.png)
 Ion map from Cardinal (Continuous imzML file)
 ![](/Ion_maps/409_21_NEG_Continuos_Cardinal.png)
 Ion map transposed (Processed imzML file, plotIMSSlice.R script)
````
plotIMSSlice(Cotton_Leaf_NEG, c(409.12, 409.32), main = "")
````
![](/Ion_maps/409_22_NEG_Processed_Transposed.png)
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

 **_m/z_ 147.06**
````
mz147_POS <- plotMsiSlice(POS_Cotton_Leaf_1, center = 147.06, tolerance = 0.1, colRamp=viridis_col)
````
 ![](/Ion_maps/147_06_POS.png)
 Ion map from Cardinal (Continuous imzML file)
 ![](/Ion_maps/147_06_POS_Continuos_Cardinal.png)
  Ion map transposed (Processed imzML file, plotIMSSlice.R script)
````
plotIMSSlice(Cotton_Leaf_POS, c(146.96, 147.16), main = "")
````
![](/Ion_maps/147_06_POS_Processed_Transposed.png)
**_m/z_ 275.13**
````
mz275_POS <- plotMsiSlice(POS_Cotton_Leaf_1, center = 275.13, tolerance = 0.1, colRamp=viridis_col)
````
 ![](/Ion_maps/275_13_POS.png)
 Ion map from Cardinal (Continuous imzML file)
 ![](/Ion_maps/275_13_POS_Continuos_Cardinal.png)
   Ion map transposed (Processed imzML file, plotIMSSlice.R script)
````
plotIMSSlice(Cotton_Leaf_POS, c(275.03, 275.23), main = "")
````
![](/Ion_maps/275_13_POS_Processed_Transposed.png)
 **_m/z_ 411.24**
 ````
mz411_POS <- plotMsiSlice(POS_Cotton_Leaf_1, center = 411.24, tolerance = 0.1, colRamp=viridis_col)
````
 ![](/Ion_maps/411_24_POS.png)
 Ion map from Cardinal (Continuous imzML file)
 ![](/Ion_maps/411_24_POS_Continuos_Cardinal.png)
Ion map transposed (Processed imzML file, plotIMSSlice.R script)
````
plotIMSSlice(Cotton_Leaf_POS, c(411.14, 411.34), main = "")
````
![](/Ion_maps/411_24_POS_Processed_Transposed.png)
 **Note:**
 
 Code to get the viridis color scale
 
 ````
 viridis_col <- colorRamp(c("#440154FF","#481567FF","#482677FF", "#453781FF", "#404788FF", "#39568CFF", "#33638DFF", "#2D708EFF", "#287D8EFF", "#238A8DFF", "#1F968BFF", "#20A387FF", "#29AF7FFF",  "#3CBB75FF", "#55C667FF", "#73D055FF", "#95D840FF", "#B8DE29FF", "#DCE319FF", "#FDE725FF"))
 ````
   
