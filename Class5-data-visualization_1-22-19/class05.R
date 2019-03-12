# Class 05 R graphics intro

# My first boxplot
x <- rnorm(1000,0)
boxplot(x)

summary(x)
hist(x)

boxplot(x,horizontal = TRUE)

# hands on session 2

read.table("bimm143_05_rstats/weight_chart.txt")
weight <- read.table("bimm143_05_rstats/weight_chart.txt", header= TRUE)

plot(weight, typ="o", pch=15, cex= 1.5, lwd= 2, ylim= c(2,10), xlab= "Age(months)", ylab= "Weight(kg)", main= "Change in baby weight over 9 months")

##barplots
feat <- read.table("bimm143_05_rstats/feature_counts.txt", header= TRUE, sep="\t")

read.delim("bimm143_05_rstats/feature_counts.txt")
mouseg <- read.delim("bimm143_05_rstats/feature_counts.txt")

barplot(mouseg$Count)
barplot (mouseg$Count, horiz= TRUE, names.arg = mouseg$Feature, las=2)
#change margin
par(mar= c(5.1, 12.1, 4.1, 5.1))
barplot (mouseg$Count, horiz= TRUE, names.arg = mouseg$Feature, las=2, xlab="Counts", main= "Counts of Features in the Mouse GRCm38 Genome", col=rainbow(12))


#Histograms
hist(c(rnorm(10000), rnorm(10000)+4), breaks=80, xlab = "x", main= "Histogram X")

#color vectors
read.table("bimm143_05_rstats/male_female_counts.txt", header= TRUE, sep = "\t")
gender <- read.table("bimm143_05_rstats/male_female_counts.txt", header= TRUE, sep = "\t")
barplot(gender$Count, ylab = "Counts", names.arg = gender$Sample, las=2, col=rainbow(nrow(gender)))
barplot(gender$Count, ylab = "Counts", names.arg = gender$Sample, las=2, col= c("blue2", "red2"))
#coloring by value
genes<- read.delim("bimm143_05_rstats/up_down_expression.txt")
table(genes$State)
plot (genes$Condition1, genes$Condition2, col= genes$State, ylab= "Expression Condition 2", xlab= "Expression Condition 1")
palette(c ("red", "lightgray", "blue"))
plot (genes$Condition1, genes$Condition2, col= genes$State, ylab= "Expression Condition 2", xlab= "Expression Condition 1")
#dynamic use of color
meth <- read.delim("bimm143_05_rstats/expression_methylation.txt")
nrow(meth)

dcols <- densCols(meth$gene.meth, meth$expression)
plot(meth$gene.meth, meth$expression, col= dcols, pch=20)
inds <- meth$expression>0 
plot(meth$gene.meth[inds], meth$expression[inds], col=dcols, pch=20)

dcols.heat <- densCols(meth$gene.meth[inds], meth$expression[inds],colramp = colorRampPalette(c("blue", "green", "red", "yellow")) )
plot(meth$gene.meth[inds], meth$expression[inds], col= dcols.heat, pch=20)
#mapping colors
plot(meth$promoter.meth, meth$gene.meth)
colorRampPalette(c("gray", "red"))(100)

map.colors <- function (value,high.low,palette) {
  proportion <- ((value-high.low[1])/(high.low[2]-high.low[1]))
  index <- round ((length(palette)-1)*proportion)+1
  return (palette[index])
}
mycols <- map.colors(meth$expression, c(max(meth$expression), min(meth$expression)), colorRampPalette(c("blue", "red"))(100))
plot(meth$promoter.meth, meth$gene.meth, ylab= "Gene Methylation", xlab="Promoter Methylation", col= mycols)

