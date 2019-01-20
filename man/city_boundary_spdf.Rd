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
\examples{
# load necessary packages ----
library(sp)

# load necessary data ----
data("city_boundary_spdf")

# plot Chicago ----
par(mar = c(0, 0, 1, 0))

plot(city_boundary_spdf
     , main = "City of Chicago boundary"
     , col = "gray85"
     , border = "dodgerblue4")
}
\seealso{
\itemize{
\item \code{?pointdexter::city_boundary_sf}
}
}
\keyword{datasets}
