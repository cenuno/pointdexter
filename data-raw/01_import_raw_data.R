#
# Author:   Cristian E. Nuno
# Purpose:  Import raw data sets
# Date:     December 28, 2018
#

# load necessary data ----

# community areas' permalink:               https://data.cityofchicago.org/Facilities-Geographic-Boundaries/Boundaries-Community-Areas-current-/cauq-8yn6
# city boundary permalink:                  https://data.cityofchicago.org/Facilities-Geographic-Boundaries/Boundaries-City/ewy2-6yfk
# SY1819 chicago public schools permalink:  https://data.cityofchicago.org/Education/Chicago-Public-Schools-School-Profile-Information-/kh4r-387c

chicago.data <-
  list("chicago_community_area_boundaries.geojson" = "https://data.cityofchicago.org/api/geospatial/cauq-8yn6?method=export&format=GeoJSON"
    , "chicago_city_boundary.geojson" = "https://data.cityofchicago.org/api/geospatial/ewy2-6yfk?method=export&format=GeoJSON"
    , "chicago_public_schools_sy1819.csv" = "https://data.cityofchicago.org/api/views/kh4r-387c/rows.csv?accessType=DOWNLOAD")

# download all files to data-raw/ ----
mapply(function(i, j)
  download.file(i, destfile = file.path("data-raw", j))
  , chicago.data
  , names(chicago.data)
  , SIMPLIFY = FALSE)

# end of script #
