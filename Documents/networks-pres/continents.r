
pdf(file="subscribers-pc.pdf")
data <- c(26.27, 24.02, 20.05, 13.72, 6.75, 6.23, 2.95)
names(data) <- c("South & East Asia","Western Europe", "North America","Asia Pacific","Latin America","Eastern Europe", "Middle East & Africa")
barplot(data,las=2)
dev.off()