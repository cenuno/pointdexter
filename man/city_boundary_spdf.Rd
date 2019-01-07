\name{city_boundary_spdf}
\alias{city_boundary_spdf}
\docType{data}
\title{
A SpatialPolygonsDataFrame of the city boundary of Chicago
}
\description{
A SpatialPolygonsDataFrame of the city boundary of Chicago that can only be used with the \href{https://www.rdocumentation.org/packages/sp/versions/1.3-1}{\code{sp}} and \href{https://www.rdocumentation.org/packages/rgdal/versions/1.3-6}{\code{rgdal}} packages.
}
\usage{data("city_boundary_spdf")}
\format{
  A SpatialPolygonsDataFrame with 1 observation on the following 4 variables:
  \describe{
    \item{\code{name}}{CHICAGO}
    \item{\code{objectid}}{value of 1}
    \item{\code{shape_area}}{the approximate area of the polygon in square meters}
    \item{\code{shape_len}}{unknown}
  }
}
\source{
This SpatialPolygonsDataFrame comes from the City of Chicago Data Portal, \href{https://data.cityofchicago.org/Facilities-Geographic-Boundaries/Boundaries-City/ewy2-6yfk}{
Boundaries - City}. The file was last updated on June 30, 2017.
}
\references{
The following were helpful in better understanding SpatialPolygonsDataFrames:

  \describe{
    \item{\code{sp}}{\href{https://www.rdocumentation.org/packages/sp/versions/1.2-5}{sp} documentation}
    \item{\code{PROJ.4}}{\href{https://github.com/OSGeo/proj.4}{PROJ.4} Cartographic Projections Library}
    \item{\code{GDAL}}{\href{http://www.gdal.org/}{GDAL} - Geospatial Data Abstraction Library}
    \item{\code{Jeffrey Evans}}{\href{http://evansmurphy.wixsite.com/evansspatial}{Jeffrey Evans'} comprehensive \href{https://gis.stackexchange.com/questions/87789/spatialpointsdataframe-properties-and-operators-in-r}{answer} to better understand the properties and operators of spatial data}
}
}
\examples{
# load necessary packages ----
library(sp)

# load necessary data ----
data("city_boundary_spdf")

# plot Chicago ----
plot(city_boundary_spdf
     , main = "City of Chicago boundary"
     , col = "gray85"
     , border = "dodgerblue4")
}
\keyword{datasets}
