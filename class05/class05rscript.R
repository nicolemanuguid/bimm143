# Class 05 Data Visualization 
# Nicole Manuguid, A15454343

# Lets start with a scatter plot
# Before we can use it we need to load it up!

library(ggplot2)
# every ggplot has a data + aes + geoms
ggplot(data=cars)+aes(x=speed, y=dist)+geom_point()+geom_smooth(method="lm")




# change to a linear model
p <- ggplot(data=cars) + aes(x=speed, y=dist) + geom_smooth(method="lm") + geom_point()

p + labs(title = "My nice plot", x ="speed (MPH)", y="Stopping distance (ft)")

# genes 

url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)

# how many genes
nrow(genes)

# what are the column names
colnames(genes)

# how many columns
ncol(genes)

# how many "up" regulated genes?
table(genes$State)

# what fraction of ttoal genes is up-regulated?
perc <- table(genes$State)/nrow(genes)*100
round (perc, 2)

# scatterplot

p <- ggplot(genes) + aes (x=Condition1, y=Condition2, col=State) + geom_point()
p + scale_colour_manual( values=c( "blue","gray", "red")) + labs (title="Gene Expression Changes Upon Drug Treatment", x="Control (no drug", y="Drug Treatment")