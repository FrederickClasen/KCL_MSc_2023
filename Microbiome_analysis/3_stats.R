# calculate statistics 

data <- read.csv('species_abd.csv')
data <- melt(data)                            
data$group <- substr(data$variable, 0, 1)
head(data)

pvalue <- numeric()
lfc <- numeric()
i <- 0
for (species in unique(data$clade_name)){
  i <- i + 1
  print(species)
  dat <- subset(data,data$clade_name == species)
  if (length(unique(dat$value)) > 1) {
    m1 <- wilcox.test(value ~ group, data=dat, na.rm=TRUE, paired=FALSE, exact=FALSE)
    pvalue[i] <- m1$p.value
    
    h <- subset(dat,dat$group == 'H')$value
    l <- subset(dat,dat$group == 'L')$value
    fc <- mean(h) / mean(l)
    lfc[i] <- log2(fc)
  }
}

stats_df <- data.frame(clade_name = unique(data$clade_name),
                       pvalue = pvalue,
                       lfc = lfc)
stats_df$padj <- p.adjust(stats_df$pvalue,method = "BH")

# to subset for significant species
stats_df_sig <- subset(stats_df,stats_df$padj <= 0.05)

# Exercise

# use the nrow function and subset to count how many species are significant
# when considering p-values versus when we consider p-adjusted values
# use a cutoff of 0.05




dat <- subset(data,data$clade_name == 'Roseburia_inulinivorans') 
m1 <- wilcox.test(value ~ group, data=dat, na.rm=TRUE, paired=FALSE, exact=FALSE, conf.int=TRUE)
m1$p.value

dat <- subset(data,data$clade_name == "Massiliimalia_timonensis")
dat
