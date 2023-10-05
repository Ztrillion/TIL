library(ggplot2)
x <- seq(-1.99, 1.99, by = 0.01)
y <- log(2*x + 4)

xrange <- range(x)
yrange <- range(y)

nx <- floor((xrange[2] - xrange[1]) / 0.1) + 1
ny <- floor((yrange[2] - yrange[1]) / 0.1) + 1



plot(x, y, type="l", main="y = ln(2x + 4)", xlab="x", ylab="y", col="blue",
     xaxp=c(xrange[1], xrange[2], nx), yaxp=c(yrange[1], yrange[2], ny))
abline(h=0, v=0, col="black", lty=2)
grid(col="gray")

# x가 0일 때의 y값을 계산합니다.
y_mark <- log(4)
points(0, y_mark, pch=16, col="red")
text(0, y_mark, labels=sprintf("(0, %.2f)", y_mark), pos=4, col="darkred")

# y가 0일 때의 x값을 계산합니다.
x_mark <- -3/2
points(x_mark, 0, pch=16, col="red")
text(x_mark, 0, labels=sprintf("(%.2f,0)", x_mark), pos=1, col="darkred")
