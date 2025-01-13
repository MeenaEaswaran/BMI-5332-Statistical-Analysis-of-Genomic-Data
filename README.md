# BMI 5332: Statistical Analysis of Genomic Data

This repository documents a **bioinformatics project** for the BMI 5332: Statistical Analysis of Genomic Data course. The project, titled **"Transcriptomic Analysis of Respiratory Epithelial Cellular Responses Following Cigarette Smoke Exposures"**, aimed to characterize the distinct transcriptomic responses of human and mouse respiratory epithelial cells to CS exposure in the non-laryngeal airway regions grown within Air Liquid Interface (ALI) cell cultures. The study uses public datasets, bioinformatics tools, and pathway/network enrichment analysis to identify species-specific responses to CS exposure.

---
# Transcriptomic Analysis of Respiratory Epithelial Cellular Responses Following Cigarette Smoke Exposures

## Project Overview

### 1. Data Retrieval
The mouse tracheal epithelial cell Bulk RNA sequencing dataset with the accession ID **[GSE229038](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE229038)**  and the human bronchial epithelial cell Bulk RNA sequencing dataset with the accession ID **[GSE152446](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE152446)** was accessed through the **National Center for Biotechnology Information Gene Expression Omnibus (NCBI GEO)**. 

- Raw and normalized count data were retrieved using the NIH LINCS tool **[GREIN:GEO RNA-seq Experiments Interactive Navigator](https://www.ilincs.org/apps/grein/?gse=)**.

---

### 2. Exploratory Data
- **Tools used:** 
    - Principal Component Analysis (PCA) using the prcomp function from R's stats package.
    - Hierarchical clustering using the ComplexHeatmap R package.
      
- **Sample groups and sizes:**
    - Male control, Female control, Male and Female CS-exposed mice groups (n = 6 each)
    - Two male non-smokers, Six male smokers, Six female non-smokers, and two female smokers

- R scripts can be found in this [folder].
  
**Figures:**
- [Human Dataset PCA]
- [Mouse Dataset PCA]
- [Mouse Dataset Heatmap]

  ---
  
### 3. Differential Expression Analysis
- **Tools used:** DESeq2 R package for differential expression analysis and EnhancedVolcano R package for data visualization.
  - CS-exposed vs. Control Male mice
  - Data Preprocessing: Rows with low gene counts (<10) were excluded before analysis.
 
 - **Criteria for Differentially Expressed Genes (DEGs):**
   - False Discovery Rate (FDR) ≤ 0.05
   - |Fold Change| > 1.5
     
- R scripts can be found in this [folder].
  
**Figures:**
- [CS-exposed vs. Control Volcano Plot]

  ---

### 3. Functional Enrichment Analysis
- **Tools used:**
  - **[Metascape](https://metascape.org/gp/index.html#/main/step1)** was used for comparative analysis across experimental timepoints.
  - GO Biological Process (BP), Cellular Compartment (CC), and Molecular Function (MF)
  - Pathway databases: KEGG, Reactome, and WikiPathways
    
- **Key Parameters for Enrichment Significance:**
  - Minimum gene overlap = 3
  - Enrichment p-value cutoff = 0.05
  - Minimum enrichment factor = 1.5
  
**Figures:**
- [Enrichment bar plot]
  
---

## Citation
If you use the tools or dataset mentioned in this repository in your research, please cite the following references:

- Ashburner, M., Ball, C. A., Blake, J. A., Botstein, D., Butler, H., Cherry, J. M., Davis, A. P., Dolinski, K., Dwight, S. S., Eppig, J. T., Harris, M. A., Hill, D. P., Issel-Tarver, L., Kasarskis, A., Lewis, S., Matese, J. C., Richardson, J. E., Ringwald, M., Rubin, G. M., & Sherlock, G. (2000). Gene Ontology: tool for the unification of biology. Nature Genetics 2000 25:1, 25(1), 25–29. https://doi.org/10.1038/75556
  
- Barrett, T., Wilhite, S. E., Ledoux, P., Evangelista, C., Kim, I. F., Tomashevsky, M., Marshall, K. A., Phillippy, K. H., Sherman, P. M., Holko, M., Yefanov, A., Lee, H., Zhang, N., Robertson, C. L., Serova, N., Davis, S., & Soboleva, A. (2013). NCBI GEO: archive for functional genomics data sets—update. Nucleic Acids Research, 41(D1), D991–D995. https://doi.org/10.1093/NAR/GKS1193

- Bodas, M., Moore, A. R., Subramaniyan, B., Georgescu, C., Wren, J. D., Freeman, W. M., Brown, B. R., Metcalf, J. P., & Walters, M. S. (2021). Cigarette Smoke Activates NOTCH3 to Promote Goblet Cell Differentiation in Human Airway Epithelial Cells. American journal of respiratory cell and molecular biology, 64(4), 426–440. https://doi.org/10.1165/rcmb.2020-0302OC

- Blighe K, Rana S, Lewis M (2024). EnhancedVolcano: Publication-ready volcano plots with enhanced colouring and labeling. R package version 1.24.0, https://github.com/kevinblighe/EnhancedVolcano

- Ghosh, B., Chengala, P. P., Shah, S., Chen, D., Karnam, V., Wilmsen, K., Yeung-Luk, B., & Sidhaye, V. K. (2023). Cigarette smoke-induced injury induces distinct sex-specific transcriptional signatures in mice tracheal epithelial cells. American journal of physiology. Lung cellular and molecular physiology, 325(4), L467–L476. https://doi.org/10.1152/ajplung.00104.2023

- Kanehisa, M. (2019). Toward understanding the origin and evolution of cellular organisms. Protein Science, 28(11), 1947–1951. https://doi.org/10.1002/PRO.3715
  
- Kanehisa, M., Furumichi, M., Sato, Y., Kawashima, M., & Ishiguro-Watanabe, M. (2023). KEGG for taxonomy-based analysis of pathways and genomes. Nucleic Acids Research, 51(D1), D587–D592. https://doi.org/10.1093/NAR/GKAC963

- Kanehisa, M., & Goto, S. (2000). KEGG: Kyoto Encyclopedia of Genes and Genomes. Nucleic Acids Research, 28(1), 27–30. https://doi.org/10.1093/NAR/28.1.27

- Love, M. I., Huber, W., & Anders, S. (2014). Moderated estimation of fold change and dispersion for RNA-seq data with DESeq2. Genome Biology, 15(12), 1–21. https://doi.org/10.1186/S13059-014-0550-8/FIGURES/9

- Mahi, N. Al, Najafabadi, M. F., Pilarczyk, M., Kouril, M., & Medvedovic, M. (2019). GREIN: An Interactive Web Platform for Re-analyzing GEO RNA-seq Data. Scientific Reports, 9(1). https://doi.org/10.1038/S41598-019-43935-8

- Miller, M. A., Danhorn, T., Cruickshank-Quinn, C. I., Leach, S. M., Jacobson, S., Strand, M. J., Reisdorph, N. A., Bowler, R. P., Petrache, I., & Kechris, K. (2017). Gene and metabolite time-course response to cigarette smoking in mouse lung and plasma. PLoS ONE, 12(6), e0178281. https://doi.org/10.1371/JOURNAL.PONE.0178281

- Zhou, Y., Zhou, B., Pache, L., Chang, M., Khodabakhshi, A. H., Tanaseichuk, O., Benner, C., & Chanda, S. K. (2019). Metascape provides a biologist-oriented resource for the analysis of systems-level datasets. Nature Communications 2019 10:1, 10(1), 1–10. https://doi.org/10.1038/s41467-019-09234-6

---

For questions or issues, please contact the repository maintainer. Refer to the [final class paper] for detailed information and results.

This repository is **solely for educational purposes and serves as a backup** for my graduate school assignments related to the **BMI 5332: Statistical Analysis of Genomic Data** course at McWilliams School of Biomedical Informatics at UTHealth Houston.



