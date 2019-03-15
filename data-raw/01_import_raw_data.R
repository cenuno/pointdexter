#
# Author:   Cristian E. Nuno
# Purpose:  Import raw data sets
# Date:     March 14, 2019
#

# load necessary data ----

# 2010 chicago census tracts permalink:     https://data.cityofchicago.org/Facilities-Geographic-Boundaries/Boundaries-Census-Tracts-2010/5jrd-6zik
# community areas' permalink:               https://data.cityofchicago.org/Facilities-Geographic-Boundaries/Boundaries-Community-Areas-current-/cauq-8yn6
# city boundary permalink:                  https://data.cityofchicago.org/Facilities-Geographic-Boundaries/Boundaries-City/ewy2-6yfk
# SY1819 chicago public schools permalink:  https://data.cityofchicago.org/Education/Chicago-Public-Schools-School-Profile-Information-/kh4r-387c

chicago.data <-
  list("chicago_2010_census_tracts.geojson" = "https://data.cityofchicago.org/api/geospatial/5jrd-6zik?method=export&format=GeoJSON"
    , "chicago_community_area_boundaries.geojson" = "https://data.cityofchicago.org/api/geospatial/cauq-8yn6?method=export&format=GeoJSON"
    , "chicago_city_boundary.geojson" = "https://data.cityofchicago.org/api/geospatial/ewy2-6yfk?method=export&format=GeoJSON"
    , "chicago_public_schools_sy1819.csv" = "https://data.cityofchicago.org/api/views/kh4r-387c/rows.csv?accessType=DOWNLOAD")

# download all files to data-raw/ ----
mapply(function(i, j)
  download.file(i, destfile = file.path("data-raw", j))
  , chicago.data
  , names(chicago.data)
  , SIMPLIFY = FALSE)

# end of script #
