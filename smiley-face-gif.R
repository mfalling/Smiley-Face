# Create Mouth ------------------------------------------------------------

# Empty df
mouth <- data.frame()

# Create a parabola, `y`, and imperatively draw each point.
for (i in -20:10){
  x <- i
  y <- .1*x^2 + x + 10
  coords <- cbind(x, y)
  mouth <- rbind(mouth, coords)
  plot(mouth$x, mouth$y, xlim = c(-50,50), ylim = c(0,125))
}


# Prep for Eyes -----------------------------------------------------------

# Set radius (how big the eyes are)
radius <- 3

# Set theta (amount of dots and angle)
theta <- seq(from = 0, to = 5.5,  by = .5)

# Set coordinates for circles (left and right eyes)
ycoords <- sin(theta) * (radius * 2.5) + 50
Lxcoords <- cos(theta) * (radius) + -10
Rxcoords <- cos(theta) * (radius) + 1

# Create Eyes -------------------------------------------------------------

# Draw the left eye
lefteye <- data.frame()
for (i in 1:12) {
  coords <- cbind(Lxcoords[i], ycoords[i])
  lefteye <- rbind(lefteye, coords)
  points(lefteye$V1, lefteye$V2, xlim = c(-50,50), ylim = c(0,125))
}

# Draw the right eye
righteye <- data.frame()
for (i in 1:12) {
  coords <- cbind(Rxcoords[i], ycoords[i])
  righteye <- rbind(righteye, coords)
  points(righteye$V1, righteye$V2, xlim = c(-50,50), ylim = c(0,125))
}