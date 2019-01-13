#
# Author:   Cristian E. Nuno
# Purpose:  Create logo for pointdexter
# Date:     January 12, 2019
#

# load necessary package ----
library(sp)

# load necessary data ----
load(file = "data/community_areas_spdf.rda")
load(file = "data/cps_sy1819.rda")

# store max and min latitudinal coordinates ---
north.lat <- 41.90449
south.lat <- 41.81009

# filter cps schools to those that meet the condition ----
df <-
  cps_sy1819[cps_sy1819$is_high_school &
               cps_sy1819$overall_rating == "Level 1+" &
               (cps_sy1819$school_latitude >= north.lat |
               cps_sy1819$school_latitude <= south.lat), ]

# define new mapping for avenir font ----
quartzFonts(avenir = c("Avenir Book", "Avenir Black", "Avenir Book Oblique",
                       "Avenir Black Oblique"))

# plot all 77 community areas and export results as png ----

# open up plot device
png("man/figures/base_logo.png"
    , width = 6.777778
    , height = 5.833333
    , units = "in"
    , res = 600)

# customize plotting parameters
par(bg = "dodgerblue4"
    , family = "avenir"
    , mar = c(0.75, 0.75, 0, 1.15))

# plot community areas
plot(community_areas_spdf
     , col = "dodgerblue4"
     , border = "#E8EAEB")

# add text in the middle of the plot
legend(x = -87.94011
       , y = 41.90
       , legend = "pointdexter"
       , cex = 3
       , adj = 0
       , text.col = "white"
       , text.font = 2
       , box.col = "dodgerblue4"
       , bg = "dodgerblue4")

# add copyright text to plot
text(x = -87.83062
     , y = 41.66055
     , labels = "http://cenuno.github.io/pointdexter/"
     , cex = 0.50
     , col = "white")

# add school points
points(x = df$school_longitude
       , y = df$school_latitude
       , pch = 19
       , col = "#D44500"
       , cex = 1
       , adj = 0.5)

dev.off()

# note: -----
# base_logo.png is then taken into Microsoft Word for cropping
# it into the shape of a hexagon.
#
# the modified base_logo.png is then saved as logo.png

# end of script #
