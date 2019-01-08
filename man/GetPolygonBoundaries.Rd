\name{GetPolygonBoundaries}
\alias{GetPolygonBoundaries}
\title{
Obtains the boundaries of the polygon(s)
}
\description{
\code{GetPolygonBoundaries()} returns the longitudinal and latitudinal points - coordinate pairs - that make up the boundary of the polygon.
}
\usage{
GetPolygonBoundaries(my.polygon, labels)
}
\arguments{
  \item{my.polygon}{Either a SpatialPolygonsDataFrame data or a sf object. See \href{https://www.rdocumentation.org/packages/sp/versions/1.2-5/topics/SpatialPolygonsDataFrame-class}{\code{?sp::`SpatialPolygonsDataFrame-class`}} or \href{https://cran.r-project.org/web/packages/sf/vignettes/sf1.html}{\code{vignette('sf1', 'sf')}} for more help.}
  \item{labels}{A character vector of polygon boundary labels used to name each matrix}
}
\details{
\code{my.polygon} accepts a spatial object that contains a singular polygon (i.e. the boundary of the City of Chicago) or many polygons (i.e. a polygon for each the 77 Chicago community areas).
}
\value{
If \code{my.polygon} is of length 1, a matrix of coordinate pairs will be returned; otherwise, a list of labeled matrices, with each matrix representing the coordinate pairs that make the boundary of each particular polygon in \code{my.polygon}.
}
\note{
This \href{https://github.com/r-spatial/sf/wiki}{wiki-page} was useful in helping me migrate from \code{sp}, \code{rgeos}, and \code{rgdal} to \code{sf}.
}
\examples{
## SpatialPolygonsDataFrame, one polygon example ## -----

# load necessary data ----
data("city_boundary_spdf")

# obtain boundaries for the City of Chicago ----
boundaries <-
  GetPolygonBoundaries(my.polygon = community_areas_sf
                       , labels = community_areas_sf$community)


## SpatialPolygonsDataFrame, multipolygon polygon example ## -----

# load necessary data ----
data("community_areas_spdf")

# obtain boundaries for each of the 77 Chicago community areas ----
boundaries <-
  GetPolygonBoundaries(my.polygon = community_areas_spdf
                       , labels = community_areas_spdf$community)

## sf, one polygon example ## -----

# load necessary package ----
library(sf)

# load necessary data ----
data("city_boundary_sf")

# obtain boundaries for the City of Chicago ----
boundaries <- GetPolygonBoundaries(my.polygon = city_boundary_sf)

## sf, multipolygon polygon example ## -----

# load necessary package ----
library(sf)

# load necessary data ----
data("community_areas_sf")

# obtain boundaries for each of the 77 Chicago community areas ----
boundaries <-
  GetPolygonBoundaries(my.polygon = community_areas_sf
                       , labels = community_areas_sf$community)
}
