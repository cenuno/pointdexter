\name{LabelPointsWithinPolygons}
\alias{LabelPointsWithinPolygons}
\title{
Labels points located inside a polygon
}
\description{
\code{LabelPointsWithinPolygons()} identifies which points lie inside each polygon and labels them accordingly.
}
\usage{
LabelPointsWithinPolygons(lng, lat, polygon.boundaries)
}
\arguments{
  \item{lng}{A numeric vector of non-NA longitudinal points.}
  \item{lat}{A numeric vector of non-NA latitudinal points.}
  \item{polygon.boundaries}{Either a coordinate pair matrix or a named list of coordinate pair matrices obtained from \code{\link{GetPolygonBoundaries}}.}
}
\details{
If points fall exactly on polygon boundaries, the default NULL gives arbitrary assignments. For more information, please see the \code{bound} argument within \href{https://www.rdocumentation.org/packages/splancs/versions/2.01-40/topics/inpip}{\code{splancs::inpip()}}.
}
\value{
If \code{polygon.boundaries} is a coordinate pair matrix, a logical vector will be returned identifying those points which lie in the polygon; otherwise, a character vector will be returned identifying the polygon each coordinate pair lies in.
}
\examples{
## SpatialPolygonsDataFrame, one polygon example ## -----

# load necessary data ----
data("city_boundary_spdf")
data("cps_sy1819")

# obtain boundaries for the City of Chicago ----
boundaries <-
  GetPolygonBoundaries(my.polygon = city_boundary_spdf)

# identify which schools lie within the City of Chicago -----
cps_sy1819$citywide <-
  LabelPointsWithinPolygons(lng = cps_sy1819$school_longitude
                            , lat = cps_sy1819$school_latitude
                            , polygon.boundaries = boundaries)

## SpatialPolygonsDataFrame, multipolygon polygon example ## -----

# load necessary data ----
data("community_areas_spdf")
data("cps_sy1819")

# obtain boundaries for each of the 77 Chicago community areas ----
boundaries <-
  GetPolygonBoundaries(my.polygon = community_areas_spdf
                       , labels = community_areas_spdf$community)

# identify the schools which lie within each of the 77 Chicago community areas -----
cps_sy1819$community <-
  LabelPointsWithinPolygons(lng = cps_sy1819$school_longitude
                            , lat = cps_sy1819$school_latitude
                            , polygon.boundaries = boundaries)

\donttest{
## sf, one polygon example ## -----

# load necessary package ----
library(sf)

# load necessary data ----
data("city_boundary_sf")
data("cps_sy1819")

# obtain boundaries for the City of Chicago ----
boundaries <-
  GetPolygonBoundaries(my.polygon = city_boundary_sf)

# identify which schools lie within the City of Chicago -----
cps_sy1819$citywide <-
  LabelPointsWithinPolygons(lng = cps_sy1819$school_longitude
                            , lat = cps_sy1819$school_latitude
                            , polygon.boundaries = boundaries)
                            }

\donttest{
## sf, multipolygon polygon example ## -----

# load necessary package ----
library(sf)

# load necessary data ----
data("community_areas_sf")
data("cps_sy1819")

# obtain boundaries for each of the 77 Chicago community areas ----
boundaries <-
  GetPolygonBoundaries(my.polygon = community_areas_sf
                       , labels = community_areas_sf$community)


# identify the schools which lie within each of the 77 Chicago community areas -----
cps_sy1819$community <-
  LabelPointsWithinPolygons(lng = cps_sy1819$school_longitude
                            , lat = cps_sy1819$school_latitude
, polygon.boundaries = boundaries)
}
}
\seealso{
\itemize{
\item \code{?pointdexter::GetPolygonBoundaries}
\item \code{?pointdexter::cps_sy1819}
}
}
