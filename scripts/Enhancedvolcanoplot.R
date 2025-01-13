####Enhanced Volcano plot

install.packages("readr")
install.packages("ggplot2")
install.packages("ggrepel")
install.packages("BiocManager")
BiocManager::install('EnhancedVolcano')

#set working directory
#setwd()

#import  data
library(readr)
data <- read.csv("for volcano_ME_edited_differential_expression_allresults_mouse.csv")
head(data)
library(ggplot2)
library(EnhancedVolcano)

#For the most basic volcano plot, only a single data-frame, data-matrix, or tibble of test results is required, containing point labels, log2FC, and adjusted or unadjusted P values. The default cut-off for log2FC is >|2|; the default cut-off for P value is 10e-6.
EnhancedVolcano(data,
                lab = rownames(data),
                x = 'log2FoldChange',
                y = 'padj')

#Modify cut-offs for log2FC and P value; specify title; adjust point and label size; remove grid lines; legend positioning
EnhancedVolcano(data,
                lab = data$gene_smbl,
                x = 'log2FoldChange',
                y = 'padj',
                title = 'Male CS-exposed mice vs Control mice',
                xlab = expression(bold(log[2] ~ fold ~ change)),
                ylab = expression (bold(''-''~log[10] ~ padj)),
                xlim = c(-5, 5),
                ylim = c(0, 15),
                pCutoff = 5.00E-02,
                FCcutoff = 0.6,
                pointSize = 2.0,
                labSize = 4.0,
                labCol = 'black',
                gridlines.major = FALSE,
                gridlines.minor = FALSE,
                colAlpha = 1,
                legendPosition = 'top',
                legendLabSize = 12,
                legendIconSize = 4.0)
#TOsave images
ggsave("volcanoplot_mouse_DEG.jpg", units="in", width=10, height=8, dpi=300)
jpeg("volcanoplot_mouse_DEG.jpg", units="in", width=10, height=8, res=300)
dev.off()


ggsave("volcanoplot.png", units="in", width=10, height=8, dpi=1200)
png("volcanoplot.png", units="in", width=10, height=8, res=1200)
dev.off()

ggsave("volcanoplot.tiff", units="in", width=10, height=8, dpi=300, compression = 'lzw')
tiff("volcanoplot.tiff", units="in", width=10, height=8, res=300, compression = 'lzw')
dev.off()

#Modify to unicolor DEGs
EnhancedVolcano(CSEvsC,
                lab = CSEvsC$gene_smbl,
                x = 'log2FoldChange',
                y = 'padj',
                title = 'CSE vs Control',
                xlab = expression(bold(log[2] ~ fold ~ change)),
                ylab = expression (bold(''-''~log[10] ~ padj)),
                pCutoff = 5.00E-02,
                FCcutoff = 0.6,
                pointSize = 2.0,
                labSize = 4.0,
                gridlines.major = FALSE,
                gridlines.minor = FALSE,
                col=c('black', 'black', 'black', 'red3'),
                colAlpha = 1,
                legendPosition = 'top',
                legendLabSize = 12,
                legendIconSize = 4.0)



#Modify colors
keyvals <- ifelse(
  CSEvsC$log2FoldChange < -0.6 & CSEvsC$padj <= 0.05 , 'green', 
  ifelse(CSEvsC$log2FoldChange > 0.6 & CSEvsC$padj <= 0.05 , 'red', 'black')
)
keyvals[is.na(keyvals)] <- 'black'
names(keyvals)[keyvals == 'red'] <- 'Upregulated'
names(keyvals)[keyvals == 'black'] <- 'ns'
names(keyvals)[keyvals == 'green'] <- 'Downregulated'


EnhancedVolcano(CSEvsC,
                lab = CSEvsC$gene_smbl,
                x = 'log2FoldChange',
                y = 'padj',
                title = 'CSE vs Control',
                selectLab = rownames(CSEvsC)[which(names(keyvals) %in% c('Upregulated', 'Downregulated'))],
                xlab = expression(bold(log[2] ~ fold ~ change)),
                ylab = expression (bold(''-''~log[10] ~ padj)),
                pCutoff = 5.00E-02,
                FCcutoff = 0.6,
                pointSize = 1.0,
                labSize = 4.0,
                xlim = c(-5, 5),
                ylim = c(0, 10),
                gridlines.major = FALSE,
                gridlines.minor = FALSE,
                legendPosition = 'top',
                legendLabSize = 12,
                legendIconSize = 4.0,
                colCustom = keyvals,
                colAlpha = 1)


#TOsave images
ggsave("JVTvsC_David_Reactome_enrichment.jpg", units="in", width=10, height=8, dpi=300)
jpeg("JVTvsC_David_Reactome_enrichment.jpg", units="in", width=10, height=8, res=300)
dev.off()


ggsave("JVTvsC_David_Reactome_enrichment.png", units="in", width=10, height=8, dpi=1200)
png("JVTvsC_David_Reactome_enrichment.png", units="in", width=10, height=8, res=1200)
dev.off()

ggsave("JVTvsC_David_Reactome_enrichment.tiff", units="in", width=10, height=8, dpi=1200, compression = 'lzw')
tiff("JVTvsC_David_Reactome_enrichment.tiff", units="in", width=10, height=8, res=1200, compression = 'lzw')
dev.off()
