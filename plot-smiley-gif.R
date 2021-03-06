# Library -----------------------------------------------------------------
library(gtools)    # To switch from alphabetical to natural sort.
library(magick)    # To make a gif.

# Create Mouth ------------------------------------------------------------

# Empty df
mouth <- data.frame()
dots <- -20:10

# Create a parabola, `y`, and imperatively draw each point.
for (i in 1:length(dots)){
  x <- dots[i]
  y <- .1*x^2 + x + 10
  coords <- cbind(x, y)
  mouth <- rbind(mouth, coords)

  # Save file.
  filename <- paste0("output/base/", "1_", i, ".png")
  png(file = filename, width = 500, height = 450)
  plot(mouth$x, mouth$y, 
       xlab = "", ylab = "",
       xlim = c(-25, 15), ylim = c(-10, 75),
       axes = FALSE, frame.plot = FALSE)
  dev.off()
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
for (i in 1:length(theta)) {
  coords <- cbind(Lxcoords[i], ycoords[i])
  lefteye <- rbind(lefteye, coords)
  
  # Save file.
  filename <- paste0("output/base/", "2_", i, ".png")
  png(file = filename, width = 500, height = 450)
  plot(mouth$x, mouth$y, 
       xlab = "", ylab = "",
       xlim = c(-25, 15), ylim = c(-10, 75),
       axes = FALSE, frame.plot = FALSE)
  points(lefteye$V1, lefteye$V2, xlim = c(-25, 15), ylim = c(-10, 75))
  dev.off()
}

# Draw the right eye
righteye <- data.frame()
for (i in 1:length(theta)) {
  coords <- cbind(Rxcoords[i], ycoords[i])
  righteye <- rbind(righteye, coords)
  
  # Save file.
  filename <- paste0("output/base/", "3_", i, ".png")
  png(file = filename, width = 500, height = 450)
  plot(mouth$x, mouth$y, 
       xlab = "", ylab = "",
       xlim = c(-25, 15), ylim = c(-10, 75),
       axes = FALSE, frame.plot = FALSE)
  points(lefteye$V1, lefteye$V2, xlim = c(-25, 15), ylim = c(-10, 75))
  points(righteye$V1, righteye$V2, xlim = c(-25, 15), ylim = c(-10, 75))
  dev.off()
}


# Make Gif ----------------------------------------------------------------

# From http://www.nagraj.net/notes/gifs-in-r/

# List & sort files.
imgs <- list.files("output/base", full.names = TRUE)
imgs <- mixedsort(imgs)
img_list <- lapply(imgs, image_read)

# Join the images together.
img_joined <- image_join(img_list)

# Animate.
img_animated <- image_animate(img_joined, fps = 20)
img_animated

# Save.
image_write(image = img_animated, path = "gifs/smiley4.gif")
