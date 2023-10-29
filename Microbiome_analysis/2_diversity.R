library("pheatmap")
library("vegan")
library("ecodist")

data <- read.csv('species_abd.csv')
rownames(data) <- data$clade_name
data$clade_name <- NULL
diversity(data$HD_10,index = 'shannon')

df <- sapply(data, function(x) diversity(x,index = 'shannon') )  
df <- melt(df)
df$group <- substr(rownames(df), 0, 1)

g <- ggplot(df,aes(x=group,y=value))
g <- g + geom_boxplot()
g <- g + stat_compare_means()
g

bray <- vegdist(t(data), method = "bray")
pcoaVS <- pco(bray, negvals = "zero", dround = 0)
pcoa_df <- as.data.frame(pcoaVS$vectors[,1:2])
rownames(pcoa_df) <- rownames(t(data))
colnames(pcoa_df) <- c('Axis1','Axis2')
pcoa_df$group <- substr(rownames(pcoa_df), 0, 1)

g <- ggplot(data=pcoa_df,aes(x=Axis1,y=Axis2,color=group))
g <- g + geom_point()
g
