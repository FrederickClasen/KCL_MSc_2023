


# This code is an example of how to run DESeq2 on a dataset from the below tutorial
# https://scienceparkstudygroup.github.io/rna-seq-lesson/
# the dataset and the code will be aavailable on KEATS and on GitHub
# https://github.com/FrederickClasen/KCL_MSc_2023


# Import libraries
library("DESeq2")
library("tidyverse")

# import the samples to conditions correspodence
xp_design <- read.csv("tutorial/samples_to_conditions.csv", 
                      header = T, 
                      stringsAsFactors = F, 
                      colClasses = rep("character",4))

# filter design file to keep only "mock" and the "infected P. syringae at 7 dpi" conditions.
xp_design_mock_vs_infected = xp_design %>% 
  filter(growth == "MgCl2" & dpi == "7")

# Import the gene raw counts
raw_counts <- read.csv("tutorial/raw_counts.csv", header = T, stringsAsFactors = F) %>% 
  column_to_rownames("Geneid")


# reorder counts columns according to the complete list of samples 
raw_counts <- raw_counts[ , xp_design$sample]
head(raw_counts)

# Filter count file accordingly (to keep only samples present in the filtered xp_design file)
raw_counts_filtered = raw_counts[, colnames(raw_counts) %in% xp_design_mock_vs_infected$sample]

## Creation of the DESeqDataSet
dds <- DESeqDataSetFromMatrix(countData = raw_counts_filtered, 
                              colData = xp_design_mock_vs_infected, 
                              design = ~ infected)

dds <- DESeq(dds)
res <- results(dds)

# have a peek at the DESeqResults object 
res

# Factor levels are important to specify
all_genes_results <- results(dds, contrast = c("infected",                      # name of the factor
                                               "Pseudomonas_syringae_DC3000",    # name of the numerator level for fold change
                                               "mock"))                          # name of the denominator level


# extracting a differential gene expression table
diff_genes = all_genes_results %>% 
  as.data.frame() %>% 
  rownames_to_column("genes") %>% 
  filter(padj < 0.01) %>% 
  arrange(desc(log2FoldChange), 
          desc(padj))
head(diff_genes)

# volcano plot
library("apeglm")

resLFC <- lfcShrink(dds = dds, 
                    res = all_genes_results,
                    type = "normal",
                    coef = "infected_Pseudomonas_syringae_DC3000_vs_mock") # name or number of the coefficient (LFC) to shrink

# load the library if not done yet
library("EnhancedVolcano")

# The main function is named after the package
EnhancedVolcano(toptable = resLFC,              # We use the shrunken log2 fold change as noise associated with low count genes is removed 
                x = "log2FoldChange",           # Name of the column in resLFC that contains the log2 fold changes
                y = "padj",                     # Name of the column in resLFC that contains the p-value
                lab = rownames(resLFC)
)


## you can continue the rest of the analysis here
## https://scienceparkstudygroup.github.io/rna-seq-lesson/06-differential-analysis/index.html




