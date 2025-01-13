#set working directory
#setwd()

# load libraries
library(tidyverse)

# Step 1: preparing count data ----------------
#all gender
# Load necessary libraries
library(ggplot2)

# Read in counts data
df <- read.csv("GSE229038_GeneLevel_Raw_data_EDA.csv", row.names = 1)

# Transpose to get sample names in the rows and genes names in the columns
df <- t(df)

# Perform PCA
pca <- prcomp(df)
pca.dat <- pca$x
pca.dat <- as.data.frame(pca.dat)

# Calculate variance explained by each principal component
pca.var <- pca$sdev^2
pca.var.percent <- round(pca.var/sum(pca.var)*100, digits = 2)

# Create a grouping variable based on sample names
group <- ifelse(grepl("GSM714820[1-6]", rownames(pca.dat)), "Female Control mice", 
                ifelse(grepl("GSM714820[7-9]|GSM714821[0-2]", rownames(pca.dat)), "Female CS-exposed mice",
                       ifelse(grepl("GSM714821[3-8]", rownames(pca.dat)), "Male Controls mice", "Male CS-exposed mice")))

# Add the grouping variable to the PCA data frame
pca.dat$Group <- factor(group)

# Plot PCA results using ggplot2 with groups highlighted
ggplot(pca.dat, aes(PC1, PC2, color = Group)) +
  geom_point(aes(shape = Group)) +
  geom_text(aes(label = rownames(pca.dat)), vjust = 2, hjust = 0.5) +
  geom_vline(xintercept = 0, linetype = "dashed", color = "red") +
  geom_hline(yintercept = 0, linetype = "dashed", color = "red") +
  labs(x = paste0('PC1: ', pca.var.percent[1], '%'),
       y = paste0('PC2: ', pca.var.percent[2], '%')) +
  scale_color_manual(values = c("Female Control mice" = "blue", "Female CS-exposed mice" = "darkgreen", 
                                "Male Control mice" = "black", "Male CS-exposed mice" = "red"))  +
  theme_gray() 

