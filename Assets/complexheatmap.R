##Using Complex Heatmap to create global gene expression plot####

if (!requireNamespace("BiocManager", quietly=TRUE))
  install.packages("BiocManager")
BiocManager::install("ComplexHeatmap", force =TRUE)

install.packages("readr")
install.packages("circlize")

#set working directory
#setwd()

#import data
library(readr)
data <- read.csv("maleonly_GREIN_GSE229038_GeneLevel_Raw_data.csv")
head(data)

#Extract just the numeric data into a matrix with named rows by gene
rownames(data) <- data$ENSEMBL
geneExp_matrix <- as.matrix(data[2:13])
head(geneExp_matrix)


#scaling the matrix to convert to Z-score
scaled_mat = t(scale(t(geneExp_matrix)))

# Remove rows/columns with NA values
scaled_mat_na <- na.omit(scaled_mat)

#scale() applies by columns, so if you want to scale by rows, you need to

#transpose the matrix t(matrix)
#scale the transposed matrix scale(t(matrix)).
#transpose it back t(scale(t(matrix))).

### generate a default heatmap with complex heatmap default colors
library(ComplexHeatmap)
library(circlize)
library(ggplot2)
#col_fun = colorRamp2(c(-1.5, 0, 1.5), c("#1A85FF", "white", "#DC3220")) - use col = in heatmap below if needed

install.packages("magick")
library(magick)

#make heatmap
Heatmap(scaled_mat_na,  
        row_names_gp = gpar(fontsize = 2.17),# Text size for row names
        name = "z-score",   
        row_names_side = "left",
        clustering_distance_rows = "pearson",
        clustering_distance_columns = "pearson",
        clustering_method_rows = "average",
        clustering_method_columns = "average",
        use_raster = TRUE
)

tiff("~/Desktop/BMI-5332_Statistical_Analysis_of_Genomic_Data/Class Project/Analysis GEOquery/Mouse/mouse_heatmap.tiff",
     width=10,
     height=10,
     units="in",
     res=300)
jpeg("~/Desktop/DiRenzo lab/nanostring/2020:2021/Nanostring_July 2021_Final analysis p < 0.05 FDR < 0.2 FC 1.25/global gene expression/ heatmap.jpeg",
     width=8,
     height=6,
     units="in",
     res=1200)
png("~/Desktop/DiRenzo lab/nanostring/2020:2021/Nanostring_July 2021_Final analysis p < 0.05 FDR < 0.2 FC 1.25/global gene expression/ heatmap.png",
    width=8,
    height=6,
    units="in",
    res=1200)

# Please note that we need to call the function dev.off() after all the plotting, to save the file and return control to the screen.
dev.off()

