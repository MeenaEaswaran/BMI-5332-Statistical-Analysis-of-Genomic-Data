# BMI 5332: Statistical Analysis of Genomic Data

This repository documents a **bioinformatics project** for the BMI 5332: Statistical Analysis of Genomic Data course. The project, titled **"Transcriptomic Analysis of Respiratory Epithelial Cellular Responses Following Cigarette Smoke Exposures"**, aimed to characterize the distinct transcriptomic responses of human and mouse respiratory epithelial cells to CS exposure in the non-laryngeal airway regions grown within Air Liquid Interface (ALI) cell cultures. The study uses public datasets, bioinformatics tools, and pathway/network enrichment analysis to identify species-specific responses to CS exposure.

---
# Transcriptomic Analysis of Respiratory Epithelial Cellular Responses Following Cigarette Smoke Exposures

## Project Overview

### 1. Data Retrieval
The mouse tracheal epithelial cell Bulk RNA sequencing dataset with the accession ID **[GSE229038](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE229038)**  and the human bronchial epithelial cell Bulk RNA sequencing dataset with the accession ID **[GSE152446](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE152446)** was accessed through the **National Center for Biotechnology Information Gene Expression Omnibus (NCBI GEO)**. 

- Raw and normalized count data were retrieved using the NIH LINCS tool **[GREIN:GEO RNA-seq Experiments Interactive Navigator](https://www.ilincs.org/apps/grein/?gse=)**.


---

### 2. Exploratory Daa
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
- **Tools used:** DESeq2 R package for differential expression analysis and EnhancedVolcano R package.
    
  1. 1 day CS-exposed vs. 1 day Control
  2. 7 day CS-exposed vs. 7 day Control
  3. 1 month CS-exposed vs. 1 month Control
  4. 3 month CS-exposed vs. 3 month Control
  5. 6 month CS-exposed vs. 6 month Control
  6. 9 month CS-exposed vs. 9 month Control
     
 - **Criteria for Differentially Expressed Genes (DEGs):**
   - False Discovery Rate (FDR) ≤ 0.05
   - |Fold Change| > 1.5
     
- R scripts can be found in this [folder](scripts).
  
**Figures:**
- [1 day CS-exposed vs. 1 day Control Volcano Plot](Assets/1dayCSvsAir.png)
- [7 day CS-exposed vs. 7 day Control Volcano Plot](Assets/7dayCSvsAir.png)
- [1 month CS-exposed vs. 1 month Control Volcano Plot](Assets/1monthCSvsAir.png)
- [3 month CS-exposed vs. 3 month Control Control Volcano Plot](Assets/3monthCSvsAir.png)
- [6 month CS-exposed vs. 6 month Control Volcano Plot](Assets/6monthCSvsAir.png)
- [9 month CS-exposed vs. 9 month Control Volcano Plot](Assets/9monthCSvsAir.png)
  
  ---

### 3. Functional Enrichment Analysis
- **Tools used:**
  - **[Metascape](https://metascape.org/gp/index.html#/main/step1)** was used for comparative analysis across experimental timepoints.
  - GO Biological Process (BP), Cellular Compartment (CC), and Molecular Function (MF) and KEGG pathway enrichments.

- **Key Parameters for Enrichment Significance:**
  - Minimum gene overlap = 3
  - Enrichment p-value cutoff = 0.05
  - Minimum enrichment factor = 1.5
  
**Figures:**
- [Comparative functional enrichment analysis-Heatmap](Assets/HeatmapSelectedGO.png)
  
---

### 4. Network Analysis and Hub Gene Identification
- **Tools used:**
  - **[StringDB version 12](https://string-db.org/)** for protein-protein interaction (PPI) network visualization.
  - **[Cytoscape](https://cytoscape.org/)** for network visualization and hub gene analysis.
    - Maximal clique centrality (MCC) algorithm from the cytoHubba plugin was utilized to determine the top ten hub genes in each PPI.

**Figures:**
- [Top ten hub genes in the regulation of inflammation PPI](Assets/inflammatoryresponse_hubgene.png)
- [Top ten hub genes in the regulation of cytokine production PPI](Assets/cytokineproduction_hubgene.png)
- [Top ten hub genes in the regulation of chemotaxis PPI](Assets/chemotaxis_regulation_hubgene.png)
- [Top ten hub genes in the regulation of cell migration PPI](Assets/cellmigration_hubgenes.png)
- [Top ten hub genes in the immune receptor activity PPI](Assets/immunereceptoractivity_hubgene.png)
- [Top ten hub genes in the lymphocyte activation PPI](Assets/lymphocyteacrtivation_hubgene.png)
- [Top ten hub genes in the extracellular matrix PPI](Assets/ECM_hubgenes.png)
  
---

### 5. ImmuneCellAI analysis
- **Tools used:**
  - **[ImmuneCellAI-mouse](https://guolab.wchscu.cn/ImmuCellAI-mouse//#!/)** to determine immune cell types from gene expression data.
  - Input data were derived from normalized gene expression counts obtained via **GREIN**.

- **Statistical Evaluation**
  - **Tool used:** GraphPad Prism version 10.4
  - **Analysis conducted:**
    - Temporal dynamics of immune cell infiltration in CS-exposed mouse lungs.
    - A two-way analysis of variance (**ANOVA**) test, followed by a **post-hoc Tukey multiple comparison test**.
    - 
**Figures:**
- [Temporal dynamics of CS-induced immune cell responses in mouse lungs](Assets/immunecellAI_gragh.jpg)

---

## Citation
If you use the tools or dataset mentioned in this repository in your research, please cite the following references:

- Ashburner, M., Ball, C. A., Blake, J. A., Botstein, D., Butler, H., Cherry, J. M., Davis, A. P., Dolinski, K., Dwight, S. S., Eppig, J. T., Harris, M. A., Hill, D. P., Issel-Tarver, L., Kasarskis, A., Lewis, S., Matese, J. C., Richardson, J. E., Ringwald, M., Rubin, G. M., & Sherlock, G. (2000). Gene Ontology: tool for the unification of biology. Nature Genetics 2000 25:1, 25(1), 25–29. https://doi.org/10.1038/75556
  
- Barrett, T., Wilhite, S. E., Ledoux, P., Evangelista, C., Kim, I. F., Tomashevsky, M., Marshall, K. A., Phillippy, K. H., Sherman, P. M., Holko, M., Yefanov, A., Lee, H., Zhang, N., Robertson, C. L., Serova, N., Davis, S., & Soboleva, A. (2013). NCBI GEO: archive for functional genomics data sets—update. Nucleic Acids Research, 41(D1), D991–D995. https://doi.org/10.1093/NAR/GKS1193

- Blighe K, Rana S, Lewis M (2024). EnhancedVolcano: Publication-ready volcano plots with enhanced colouring and labeling. R package version 1.24.0, https://github.com/kevinblighe/EnhancedVolcano

- Chin, C. H., Chen, S. H., Wu, H. H., Ho, C. W., Ko, M. T., & Lin, C. Y. (2014). cytoHubba: Identifying hub objects and sub-networks from complex interactome. BMC Systems Biology, 8(4), 1–7. https://doi.org/10.1186/1752-0509-8-S4-S11/TABLES/4

- Kanehisa, M. (2019). Toward understanding the origin and evolution of cellular organisms. Protein Science, 28(11), 1947–1951. https://doi.org/10.1002/PRO.3715
  
- Kanehisa, M., Furumichi, M., Sato, Y., Kawashima, M., & Ishiguro-Watanabe, M. (2023). KEGG for taxonomy-based analysis of pathways and genomes. Nucleic Acids Research, 51(D1), D587–D592. https://doi.org/10.1093/NAR/GKAC963

- Kanehisa, M., & Goto, S. (2000). KEGG: Kyoto Encyclopedia of Genes and Genomes. Nucleic Acids Research, 28(1), 27–30. https://doi.org/10.1093/NAR/28.1.27

- Li, C., & Xu, J. (2019). Feature selection with the Fisher score followed by the Maximal Clique Centrality algorithm can accurately identify the hub genes of hepatocellular carcinoma. Scientific Reports, 9(1), 1–11. https://doi.org/10.1038/s41598-019-53471-0

- Love, M. I., Huber, W., & Anders, S. (2014). Moderated estimation of fold change and dispersion for RNA-seq data with DESeq2. Genome Biology, 15(12), 1–21. https://doi.org/10.1186/S13059-014-0550-8/FIGURES/9

- Mahi, N. Al, Najafabadi, M. F., Pilarczyk, M., Kouril, M., & Medvedovic, M. (2019). GREIN: An Interactive Web Platform for Re-analyzing GEO RNA-seq Data. Scientific Reports, 9(1). https://doi.org/10.1038/S41598-019-43935-8

- Miao, Y. R., Xia, M., Luo, M., Luo, T., Yang, M., & Guo, A. Y. (2022). ImmuCellAI-mouse: a tool for comprehensive prediction of mouse immune cell abundance and immune microenvironment depiction. Bioinformatics, 38(3), 785–791. https://doi.org/10.1093/BIOINFORMATICS/BTAB711

- Miller, M. A., Danhorn, T., Cruickshank-Quinn, C. I., Leach, S. M., Jacobson, S., Strand, M. J., Reisdorph, N. A., Bowler, R. P., Petrache, I., & Kechris, K. (2017). Gene and metabolite time-course response to cigarette smoking in mouse lung and plasma. PLoS ONE, 12(6), e0178281. https://doi.org/10.1371/JOURNAL.PONE.0178281

- Shannon, P., Markiel, A., Ozier, O., Baliga, N. S., Wang, J. T., Ramage, D., Amin, N., Schwikowski, B., & Ideker, T. (2003). Cytoscape: a software environment for integrated models of biomolecular interaction networks. Genome Research, 13(11), 2498–2504. https://doi.org/10.1101/GR.1239303

- Szklarczyk, D., Kirsch, R., Koutrouli, M., Nastou, K., Mehryary, F., Hachilif, R., Gable, A. L., Fang, T., Doncheva, N. T., Pyysalo, S., Bork, P., Jensen, L. J., & Von Mering, C. (2023). The STRING database in 2023: protein-protein association networks and functional enrichment analyses for any sequenced genome of interest. Nucleic Acids Research, 51(D1), D638–D646. https://doi.org/10.1093/NAR/GKAC1000

- Zhou, Y., Zhou, B., Pache, L., Chang, M., Khodabakhshi, A. H., Tanaseichuk, O., Benner, C., & Chanda, S. K. (2019). Metascape provides a biologist-oriented resource for the analysis of systems-level datasets. Nature Communications 2019 10:1, 10(1), 1–10. https://doi.org/10.1038/s41467-019-09234-6

---

For questions or issues, please contact the repository maintainer. Refer to the [final class paper](Assets/Easwaran_Meena_Journal_paper.pdf) for detailed information and results.

This repository is **solely for educational purposes and serves as a backup** for my graduate school assignments related to the **BMI 5332: Statistical Analysis of Genomic Data** course at McWilliams School of Biomedical Informatics at UTHealth Houston.



