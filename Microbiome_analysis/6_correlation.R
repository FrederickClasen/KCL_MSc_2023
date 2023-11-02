#### co-abundance of species through correlation

data <- read.csv('data/species_abd.csv',row.names = 'clade_name')
stats_df_sig <- subset(stats_df,stats_df$padj <= 0.001)
data <- subset(data,row.names(data) %in% stats_df_sig$clade_name)

df_cor <- cor(t(data))

paletteLength <- 50
myColor <- colorRampPalette(c("blue", "white", "red"))(paletteLength)
# length(breaks) == length(paletteLength) + 1
# use floor and ceiling to deal with even/odd length pallettelengths
myBreaks <- c(seq(min(df_cor), 0, length.out=ceiling(paletteLength/2) + 1), 
              seq(max(df_cor)/paletteLength, max(df_cor), length.out=floor(paletteLength/2)))

p <- pheatmap(df_cor,
              breaks = myBreaks,
              color = myColor,
              fontsize=8)

#### correlate species with MELD scores --> only the liver disease patients

data <- read.csv('data/species_abd.csv',row.names = 'clade_name')
stats_df_sig <- subset(stats_df,stats_df$padj <= 0.05)
data <- subset(data,row.names(data) %in% stats_df_sig$clade_name)
data <- data[ , grepl( "LD" , names( data ) ) ]
data <- t(data)

meta_sub <- subset(meta,meta$group == 'L')
meta_sub <- as.numeric(meta_sub[,c('MELD')])

pvalue <- numeric()
coeff <- numeric()
i <- 0
for (species in colnames(data)) {
  i <- i + 1
  x <- cor.test(data[,species],meta_sub,method = 'spearman')
  pvalue[i] <- x$p.value
  coeff[i] <- x$estimate
}
cor_df <- data.frame(clade_name = colnames(data),
                     pvalue = pvalue,
                     coeff = coeff)

subset(cor_df,cor_df$pvalue<=0.05)





