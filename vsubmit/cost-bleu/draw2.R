pdf("pricecost.pdf",width=12,height=6,encoding = 'default')
library('scales')
library(gplots)
#palette( rev(rich.colors(32)))
palette(rev(rich.colors(32)))

attach(mtcars)
layout(matrix(c(1,2,1,3), 2, 2, byrow = TRUE))

newWords <- read.table("./pricebleu1.txt", header = FALSE)
#curve(Yfunc, -2*pi, 2*pi, xname = "t")
a <- as.vector(t(newWords[1]))
b <- as.vector(t(newWords[2]))
b1 <-as.vector(t(newWords[3]))

newWords <- read.table("./pricebleu2.txt", header = FALSE)
#curve(Yfunc, -2*pi, 2*pi, xname = "t")
c <- as.vector(t(newWords[1]))
d <- as.vector(t(newWords[2]))
e <- as.vector(t(newWords[3]))


newWords <- read.table("./pricebleunp2.txt", header = FALSE)
#curve(Yfunc, -2*pi, 2*pi, xname = "t")
f <- as.vector(t(newWords[1]))
g <- as.vector(t(newWords[2]))
h <- as.vector(t(newWords[3]))



plot(NULL,NULL, main=NULL, sub="(a)",
xlab="Price($)", ylab="BLEU Score",
xlim=c(0, 18000)
,ylim=c(0,40),xaxt = 'n',yaxt='n',cex = 2
)
axis(1,at = seq(0, 18000, by = 2000), las=1,tck = 0.01,cex.axis = 1)
axis(2,at = seq(0, 40, by = 5), las=1,tck = 0.01,cex.axis = 1)
grid(nx = NA,ny = NULL,lty = 1)



#lines(x, z, type=c('o'),col = 18,cex = 2,pch = '*')
lines(a, b1, type=c('o'),col = 18,cex = 4,pch = '*',lwd = 2)
lines(a, b, type=c('o'),col = 1,cex = 4,pch = '*',lwd = 2)
#for (i in 1:17 ) {
#   points(a[i], b1[i], type=c('o'),col = 'red',cex = 3,pch = '*')
#}


#lines(c, e, type=c('o'),col = 1,cex = 4,pch = '*')
#lines(f, h, type=c('o'),col = 1,cex = 4,pch = "*")
legend("bottomright",
c("Partial Ranking BLEU", "Gold Ranking BLEU"),col = c(1, 18),lty= (1),pch = '*')

plot(NULL,NULL, main=NULL, sub="(b)",
xlab="Price($) ", ylab="BLEU Score",
xlim=c(8850, 9200)
,ylim=c(20,40),xaxt = 'n',yaxt='n'
)
axis(1,at = seq(8850, 9200, by = 50), las=1,tck = 0.01,cex.axis = 1)
axis(2,at = seq(20, 40, by = 5), las=1,tck = 0.01,cex.axis = 1)
grid(nx = NA,ny = NULL,lty = 1)
lines(c, e, type=c('o'),col = 1,cex = 4,pch = '*',lwd = 2)
#lines(d, e, type=c('o'),col = 29,cex = 4,pch = '*')

#legend("bottomright",
#c("BLEU vs. Actual Cost", "BLEU vs. Predicted Cost by f(x)",
#),col = c(1, 29),lty= (1),pch = '*')

plot(NULL,NULL, main=NULL, sub="(c)",
xlab="Price($) ", ylab="BLEU Score",
xlim=c(200, 550)
,ylim=c(20,40),xaxt = 'n',yaxt='n'
)
axis(1,at = seq(200, 550, by = 50), las=1,tck = 0.01,cex.axis = 1)
axis(2,at = seq(20, 40, by = 5), las=1,tck = 0.01,cex.axis = 1)
grid(nx = NA,ny = NULL,lty = 1)
lines(f, h, type=c('o'),col = 1,cex = 4,pch = "*")
#lines(g, h, type=c('o'),col = 1,cex = 4,pch = '*')


#lines(x, w, type=c('o'),col = 29,cex = 2,pch = '*')
#legend("bottomright",
#c("Partial Ranking BLEU", "Gold Ranking BLEU",
#"Random Selection BLEU"),col = c(1, 18,29),lty= (1),pch = '*')
dev.off()
