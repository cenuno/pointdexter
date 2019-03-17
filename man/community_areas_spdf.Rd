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
