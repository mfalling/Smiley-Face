


mouth <- data.frame()
for (i in -20:10){
  x <- i
  y <- .1*x^2 + x + 10
  coords <- cbind(x, y)
  mouth <- rbind(mouth, coords)
  plot(mouth$x, mouth$y, xlim = c(-50,50), ylim = c(0,125))
}


radius <- 3

theta <- seq(from = 0, to = 5.5,  by = .5)
xcoords <- cos(theta) * (radius) + 1
ycoords <- sin(theta) * (radius * 2.5) + 50

righteye <- data.frame()
for (i in 1:12) {
  coords <- cbind(xcoords[i], ycoords[i])
  righteye <- rbind(righteye, coords)
  points(righteye$V1, righteye$V2, xlim = c(-50,50), ylim = c(0,125))
}

xv <- cos(theta) * (radius) + -10

lefteye <- data.frame()
for (i in 1:12) {
  coords <- cbind(xv[i], yv[i])
  lefteye <- rbind(lefteye, coords)
  points(lefteye$V1, lefteye$V2, xlim = c(-50,50), ylim = c(0,125))
}
