# Library -----------------------------------------------------------------
library(ggplot2)   # To generate the graph
library(gtools)    # To switch from alphabetical to natural sort.
library(magick)    # To make a gif.

# Create Mouth ------------------------------------------------------------

# Empty df
mouthCoords <- data.frame()
dots <- -20:10

# Create a parabola, `y`, and imperatively draw each point.
for (i in 1:length(dots)){
  x <- dots[i]
  y <- .1*x^2 + x + 10
  coords <- cbind(x, y)
  mouthCoords <- rbind(mouthCoords, coords)
  
  # Draw the mouth
  mouth <- ggplot() +
    geom_line(data = mouthCoords, 
              aes(x = x, y = y, size = 3)) +
    lims(x = c(-25, 15), y = c(-10, 75)) +
    annotate(geom = "text", x = -5, y = 70, size = 15, 
             label = "Don't Worry") +
    annotate(geom = "text", x = -5, y = -5, size = 15, 
             label = "Be Happy") +
    theme_void() +
    theme(plot.background = element_rect(fill = "yellow")) +
    theme(legend.position = "none")
  print(mouth)
  
  # Save the progress
  filename <- paste0("output/ggplot/", "1_", i, ".png")
  ggsave(filename, dpi = "screen")
}

# Prep for Eyes -----------------------------------------------------------

# Set radius (how big the eyes are)
radius <- 3

# Set theta (amount of dots and angle)
theta <- seq(from = 0, to = 6,  by = .25)

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
  
  # Draw the left eye
  mouth_LEye <- mouth + 
    geom_polygon(data = lefteye, aes(x = V1, y = V2)) +
    theme(legend.position = "none")
  print(mouth_LEye)
  
  # Save the progress
  filename <- paste0("output/ggplot/", "2_", i, ".png")
  ggsave(filename, dpi = "screen")
}


# Draw the right eye
righteye <- data.frame()
for (i in 1:length(theta)) {
  coords <- cbind(Rxcoords[i], ycoords[i])
  righteye <- rbind(righteye, coords)
  
  # Draw the right eye
  smiley <- mouth_LEye + 
    geom_polygon(data = righteye, aes(x = V1, y = V2)) +
    theme(legend.position = "none")
  print(smiley)
  
  # Save the smiley face
  filename <- paste0("output/ggplot/", "3_", i, ".png")
  ggsave(filename, dpi = "screen")
}


# Make Gif ----------------------------------------------------------------

# From http://www.nagraj.net/notes/gifs-in-r/

# List & sort files.
imgs <- list.files("output/ggplot", full.names = TRUE)
imgs <- mixedsort(imgs)
img_list <- lapply(imgs, image_read)

# Join the images together.
img_joined <- image_join(img_list)

# Animate.
img_animated <- image_animate(img_joined, fps = 20)
img_animated


# Save.
image_write(image = img_animated, path = "gifs/ggsmiley.gif")
