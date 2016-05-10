#########################################################
### Full heatmap in color
#########################################################

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


#########################################################
### B) Reading in data and transform it into matrix format
#########################################################

data <- read.csv("E:/ProFile CSVs/16-05-09/StatA1.csv")
mat_data <- data.matrix(data)  # transform data into a matrix

#########################################################
### C) Customizing and plotting the heat map
#########################################################

png("E:/ProFile CSVs/16-05-09/StatA1.png",    # create PNG for the heat map        
width = 20*100,        # 5 x 300 pixels
height = 20*100,
res = 100,)            # 300 pixels per inch

heatmap.2(mat_data,
  density.info="none",  # turns off density plot inside color legend
  trace="none",         # turns off trace lines inside the heat map
  margins =c(9,9),      # widens margins around plot
  col=viridis(10000),   # use on color palette defined earlier 
  dendrogram="none",
  Rowv="NA",            # turn off row clustering
  Colv="NA")            # turn off column clustering

dev.off()               # close the PNG device

