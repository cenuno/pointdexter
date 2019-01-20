\name{community_areas_spdf}
\alias{community_areas_spdf}
\docType{data}
\title{
A SpatialPolygonsDataFrame of Chicago's 77 community areas
}
\description{
77 community area boundaries in Chicago that only be used with the \href{https://www.rdocumentation.org/packages/sp/versions/1.3-1}{\code{sp}} package.
}
\usage{data("community_areas_spdf")}
\format{
  A SpatialPolygonsDataFrame with 77 observations on the following 2 variables:
  \describe{
    \item{\code{community}}{the name of each community area}
    \item{\code{area_numbe}}{the area number for each community(identical to \code{area_num_1})}

  A SpatialPolygonsDataFrame contains additional information in other \href{https://www.rdocumentation.org/packages/methods/versions/3.5.1/topics/slot}{slots} that are accessed via both \code{community_areas_spdf@[slotName]} or \code{methods::slot(community_areas_spdf, "[slotName]")}:
  \describe{
    \item{\code{data}}{a data frame object that contains information for each polygon}
    \item{\code{polygons}}{contains more slots related to each individual polygon. For more information, please see \href{https://www.rdocumentation.org/packages/sp/versions/1.2-5/topics/Polygon-class}{?sp::Polygon-class}, \href{https://www.rdocumentation.org/packages/sp/versions/1.2-5/topics/SpatialPolygons}{?sp::SpatialPolygons}, and the \href{https://stackoverflow.com/questions/8708681/getting-a-slots-value-of-s4-objects}{"Getting a slot’s value of S4 objects?" thread on Stack Overflow}}
    \item{\code{plotOrder}}{an integer vector whose value states the order in which the polygons should be plotted}
    \item{\code{bbox}}{2-column bounding box matrix holding the minimum coordinate values in the first column and maximum in the second for the longitude (first row), latitude (second row)}
    \item{\code{proj4string}}{\href{https://cenuno.github.io/Label_Points_Inside_Polygons.html}{CRS} object that is used for unprojecting or reprojecting coordinates}
  }
  }
}
\source{
This SpatialPolygonsDataFrame comes from the City of Chicago Data Portal, \href{https://data.cityofchicago.org/Facilities-Geographic-Boundaries/Boundaries-Community-Areas-current-/cauq-8yn6}{
Boundaries - Community Areas (current)}. The file was last updated on December 18, 2018.
}
\examples{
# load necessary packages ----
library(sp)

# load necessary data ----
data("community_areas_spdf")

# plot all 77 community areas -----
par(mar = c(0, 0, 1, 0))

plot(community_areas_spdf
     , main = "Chicago's 77 community areas"
     , col = "gray85"
     , border = "dodgerblue4")
}
\seealso{
\itemize{
\item \code{?pointdexter::community_areas_sf}
}
}
\keyword{datasets}
