\name{city_boundary_sf}
\alias{city_boundary_sf}
\docType{data}
\title{
City boundary of Chicago
}
\description{
A simple feature containing the city boundary of Chicago.
}
\usage{data("community_areas_sf")}
\format{
  A simple feature (which is either \code{data.frame} or \code{tibble}) with a geometry list-column with 1 observation on the following 5 variables:
  \describe{
    \item{\code{name}}{CHICAGO}
    \item{\code{objectid}}{value of 1}
    \item{\code{shape_area}}{the approximate area of the polygon in square meters}
    \item{\code{shape_len}}{unknown}
    \item{\code{geometry}}{a list that contains the dimensions and the simple feature geometry type}
  }
}
\source{
This \code{sf} object comes from the City of Chicago Data Portal, \href{https://data.cityofchicago.org/Facilities-Geographic-Boundaries/Boundaries-City/ewy2-6yfk}{
Boundaries - City}. The file was last updated on June 30, 2017.
}
\references{
\href{https://r-spatial.github.io/sf/}{\code{sf}} documentation has helpful information on how to work with \code{sf} objects.
}
\examples{
# load necessary packages ----
library(sf)

# load necessary data ----
data("city_boundary_sf")

# plot Chicago ----
plot(city_boundary_sf$geometry
     , main = "City of Chicago boundary"
     , col = "gray85"
     , border = "dodgerblue4")
}
\keyword{datasets}
