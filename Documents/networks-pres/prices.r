
pdf(file="prices.pdf")
data <- c(0.27,0.45,2.77,0.63,1.64,4.31,10.99,6.50,13,4.04)
names(data) <- c("Japan","Korea","Finland","Sweden","France","Netherlands","Portugal","Canada","Poland","Norway")
barplot(data,las=2)
dev.off()