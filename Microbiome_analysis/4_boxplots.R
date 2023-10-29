# we have loaded the necessary packages in the 1_barplots.R script
# however, remember to load these again if needed

# in this example we will show different ways to use boxplots to visualize
# microbiome abundance data and perform the necessary statistics

# Example 1: a single taxonomic group

# load the data again to be sure you are working with the correct dataframe
data <- read.csv('phylum_abd.csv')
data <- melt(data)                            
data$group <- substr(data$variable, 0, 1)
head(data) # always use head to see if the data you loaded is correct

# let's plot a barplot for Firmicutes
toPlot <- subset(data,data$clade_name=='Firmicutes')
g <- ggplot(data=toPlot,aes(x=group,y=value,fill=group))
g <- g + geom_boxplot()
g <- g + stat_compare_means()
g <- g + ggtitle('Firmicutes')
g

# Exercise: run the command below to get all the phyla and then run the above
# code block to see which ones are significant
phyla = unique(data$clade_name)
phyla

# this is a rather inefficient way to do this. Do you think we can use any 
# functions / functional programming to do this in high throughput?

# Example 2: several groups together

g <- ggplot(data=data,aes(x=group,y=value,fill=clade_name))
g <- g + geom_boxplot()
g <- g + facet_wrap(~clade_name,scales = 'free')
g <- g + ggtitle('Phylum level')
g
