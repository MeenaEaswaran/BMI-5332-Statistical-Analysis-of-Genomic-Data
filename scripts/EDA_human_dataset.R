#set working directory
#setwd()

# load libraries
library(tidyverse)
library(ggplot2)

#all gender data set
# Read in counts data
df <- read.csv("GSE152446_GeneLevel_EDA_Raw_data.csv", row.names = 1)

# Assuming df is already loaded and contains the appropriate columns
# Transpose the data frame to perform PCA on sample names
df_t <- t(df)

# Convert row names into a column for ggplot
df_t <- as.data.frame(df_t)
df_t$sample <- row.names(df_t)

# Define the groups based on sample IDs
groups <- c('Female non smoker', 'Female non smoker', 'Female non smoker', 
            'Male non smoker', 'Female non smoker', 'Female non smoker', 
            'Female non smoker', 'Male non smoker', 'Male smoker', 'Female smoker', 
            'Male smoker', 'Male smoker', 'Male smoker', 'Female smoker', 
            'Male smoker', 'Male smoker')

# Add the groups to the data frame
df_t$group <- groups

# Perform PCA
pca <- prcomp(df_t[,1:16])

# Create a data frame of the PCA results
pca_df <- as.data.frame(pca$x)

# Add sample and group information to the PCA data frame
pca_df$sample <- df_t$sample
pca_df$group <- df_t$group

# Define colors and shapes for the groups
group_colors <- c('Female non smoker' = 'blue', 'Male non smoker' = 'red', 
                  'Female smoker' = 'darkgreen', 'Male smoker' = 'purple')
group_shapes <- c('Female non smoker' = 16, 'Male non smoker' = 17, 
                  'Female smoker' = 18, 'Male smoker' = 15)

# Plot PCA using ggplot2
library(ggplot2)
 ggplot(pca_df, aes(x = PC1, y = PC2, color = group, shape = group, lable= sample)) +
  geom_vline(xintercept = 0, linetype = "dashed", color = "red") +
  geom_hline(yintercept = 0, linetype = "dashed", color = "red") +
  geom_point(size = 3) + geom_text(aes(label = sample), vjust = 2, hjust = 1, size = 2) +
  scale_color_manual(values = group_colors) +
  scale_shape_manual(values = group_shapes) +
  theme_minimal() +
  labs(x = "PC1", y = "PC2") + theme_gray()

