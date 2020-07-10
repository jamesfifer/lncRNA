#!/usr/bin/Rscript

# module load R - remember to run this on the command line first 

# set working directory 
setwd("/projectnb2/incrna/mary_lncrna/R/repeat")

# path for final output 
output_file <- "/projectnb/incrna/mary_lncrna/R/repeat/output.csv"

# columns for matrix 
p_value <- list(); corr_coef <- list(); gene1 <- list(); gene2 <- list()

# read in count files for lncRNA and mRNA (separated prior)   
raw_x <- read.table("/projectnb/incrna/mary_lncrna/R/repeat/lncRNA.csv", header = TRUE, sep=",", stringsAsFactors = F)
raw_y <- read.table("/projectnb/incrna/mary_lncrna/R/repeat/mRNA.csv", header = TRUE, sep=",", stringsAsFactors = F)


# edit data so that gene names are set as row names and not in a column by themselves 
x <- raw_x[,-1]
rownames(x) <- raw_x[,1]

x <- as.matrix(x)

y <- raw_y[,-1]
rownames(y) <- raw_y[,1]

y <- as.matrix(y)

# pearson correlation test 
for (i in 1:nrow(x)) {
  for (j in 1:nrow(y)){
    c <- cor.test(x[i,], y[j,], method = "pearson") 
    # filter out the values based on the cutoff values: corr coef >= |0.95| and a P-value < 0.05
    if (abs(c$estimate) >= 0.95 & c$p.value < 0.05) {
      gene1 <- c(gene1,rownames(x)[i]) # get name of first gene 
      gene2 <- c(gene2,rownames(y)[j]) # get name of second gene 
      p_value <- c(p_value,c$p.value) # get p-value 
      corr_coef <- c(corr_coef,c$estimate) # get correlation coefficient 
    }
  }}
ds <- cbind(gene1,gene2,corr_coef,p_value)
ds <- as.data.frame(ds)
ds <- apply(ds,2,as.character)
write.table(ds, output_file)
