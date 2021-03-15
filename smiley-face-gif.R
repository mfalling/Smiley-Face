
x <- 5
c <- 0
a <- .1
b <- 1
y <- a*(x^2) + b*x + c

mouth <- data.frame()
for (i in -25:15){
  x <- i
  y <- a*x^2 + b*x + c
  print(y)
  coords <- cbind(x, y)
  mouth <- rbind(mouth, coords)
  plot(mouth$x, mouth$y, xlim = c(-50,50), ylim = c(0,125))
}

