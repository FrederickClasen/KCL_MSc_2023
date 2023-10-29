library("pheatmap")
library("vegan")

data <- read.csv('species_abd.csv')
rownames(data) <- data$clade_name
data$clade_name <- NULL
diversity(data$HD_10,index = 'shannon')

df <- sapply(data, function(x) diversity(x,index = 'shannon') )  
df <- melt(df)
df$group <- substr(rownames(df), 0, 1)
df

g <- ggplot(df,aes(x=group,y=value))
g <- g + geom_boxplot()
g
