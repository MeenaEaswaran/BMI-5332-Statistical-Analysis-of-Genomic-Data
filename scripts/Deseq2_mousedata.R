 # script to perform differential gene expression analysis using DESeq2 package
#set working directory
#setwd()
 
 # load libraries
 library(DESeq2)
 library(tidyverse)

  # Step 1: preparing count data ----------------
 
 # read in counts data
 counts_data <- read.csv("maleonly_GREIN_GSE229038_GeneLevel_Raw_data.csv", row.names = 1)
 head(counts_data)
 
  # read in sample info
 colData <- read.csv("maleonly_GREIN_GSE229038_filtered_metadata.csv", row.names = 1)
 View (colData )
 
  # making sure the row names in colData matches to column names in counts_data
 all(colnames(counts_data) %in% rownames(colData)) #should be TRUE
 
 # are they in the same order? #Otherwise DEseq2 will cause an error
 all(colnames(counts_data) == rownames(colData)) #should be TRUE
 
 
 # Step 2: construct a DESeqDataSet object ----------
 
 dds <- DESeqDataSetFromMatrix(countData = counts_data,
                               colData = colData,
                               design = ~ treatment)
 
 dds
 
 # pre-filtering: removing rows with low gene counts #recommended or not required
 # keeping rows that have at least 10 reads total 
 keep <- rowSums(counts(dds)) >= 10
 keep
 dds <- dds[keep,]
 
 dds
 
 # set the factor level
 dds$treatment <- relevel(dds$treatment, ref = "Control")
 
 # NOTE: collapse technical replicates; collapsereplicates is provided Deseq only for technical replicates
 
 # Step 3: Run DESeq ----------------------
 dds <- DESeq(dds)
 res <- results(dds)
 
 res
   # Explore Results ----------------
 
 summary(res)
 
 #save raw results
 write.csv(res, file = "differential_expression_allresults_mouse.csv")
 
 # Filter results for significant genes based on padj and fold change
 significant_results <- subset(res, padj <= 0.05 & abs(log2FoldChange) > 0.6)
 
 # Print top significant genes
 head(significant_results)
 
 # Save results
 write.csv(significant_results, file = "sig_differential_expression_results_mouse.csv")
 
 #Do this if you want as per Bioinformatigician
 
 #res0.05 <- results(dds, alpha = 0.05)
 #summary(res0.05)
 
 # contrasts #can compare between different levels; 
 #resultsNames(dds)
 
 # MA plot
 plotMA(res)

