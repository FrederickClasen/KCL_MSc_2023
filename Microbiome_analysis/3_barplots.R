library('dplyr')
library('reshape2')
library('ggplot2')
library('ggpubr')

## Let's start with phylum level data
# read in phylum level data
data <- read.csv('data/phylum_abd.csv')
data <- melt(data)                            # use the help function to understand what melt does
data$group <- substr(data$variable, 0, 1)

# Example code to plot barplots of all samples
toPlot <- data[order(data$group),]
toPlot$variable <- factor(toPlot$variable, 
                          levels = unique(toPlot$variable))
g <- ggplot(data=toPlot,aes(x=variable,y=value,fill=clade_name))
g <- g + geom_bar(stat="identity")
g <- g + theme(axis.text.x = element_text(angle = 90,size = 4))
g

# save this plot 
# option 1: through the "Export" in the Plots window
# option 2:
pdf(file='barplot_phyla.pdf',width=10,height=5)
print(g)
dev.off()
# there similar functions for other types of files such as png, jpg, svg etc

# Exercise 1
# Use the code block above to plot the same barplot at Kingdom level (do not save it)
# Would you use this plot in a publication or report? What would be the purpose
# of plotting this?

# Exercise 2
# Use the code block above to plot the same barplot at Order level (do not save it)
# Is this type of representation informative at Class level?

# Exercise 3 (BONUS)
# Try to use the functions length and/or unique to count the total number of
# orders in the data dataframe. Use logical deduction and the help function 
# to try and figure this out 

