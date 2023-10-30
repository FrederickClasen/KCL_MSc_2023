library("pheatmap")
library("vegan")
library("ecodist")


# read in metadata (do this once)
meta <- read.csv('data/metadata_parsed.csv',row.names = 'Sample.ID')
# create an additional column for a sample group
meta$group <- substr(rownames(meta), 0, 1)
# inspect this data to see the metadata available 
head(data)
# also view this by clicking on meta in the global environment

# import species abundance data and view data
data <- read.csv('data/species_abd.csv')
head(data)
# change the rownames to cladenames and view data
rownames(data) <- data$clade_name
data$clade_name <- NULL
head(data)

# alpha diversity analysis
# calculate the diversity for one sample
diversity(data$HD_10,index = 'shannon')

# apply this function to all the columns 
df <- sapply(data, function(x) diversity(x,index = 'shannon') ) 
head(df)
df <- melt(df)
head(df)
df$group <- substr(rownames(df), 0, 1)
head(df)

# plot the diversity for all samples in a boxplot
g <- ggplot(df,aes(x=group,y=value))
g <- g + geom_boxplot()
g <- g + stat_compare_means()
g

# we will now stop writing out the head function each time we modify the data
# you can still run it to see the output

# beta-diversity analysis
bray <- vegdist(t(data), method = "bray")
pcoaVS <- pco(bray, negvals = "zero", dround = 0)
pcoa_df <- as.data.frame(pcoaVS$vectors[,1:2])
rownames(pcoa_df) <- rownames(t(data))
colnames(pcoa_df) <- c('Axis1','Axis2')
pcoa_df$group <- substr(rownames(pcoa_df), 0, 1)

# plot the diversity for all samples in a scatter plot
g <- ggplot(data=pcoa_df,aes(x=Axis1,y=Axis2,color=group))
g <- g + geom_point()
g

# Exercise 
# run the piece of code below to make a new dataframe that contains
# the metadata for all the samples as additional columns to the pcoa_df
# dataframe 
df = merge(pcoa_df,meta,by=0)
rownames(df) = df$Row.names
df$Row.names = NULL
head(df)

# now run the ggplot code block above and color each sample by Gender
# instead of the group
g <- ggplot(data=df,aes(x=Axis1,y=Axis2,color=Gender))
g <- g + geom_point()
g

