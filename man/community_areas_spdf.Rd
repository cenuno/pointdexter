\name{community_areas_spdf}
\alias{community_areas_spdf}
\docType{data}
\title{
A SpatialPolygonsDataFrame of Chicago's 77 community areas
}
\description{
77 community area boundaries in Chicago that only be used with the \href{https://www.rdocumentation.org/packages/sp/versions/1.3-1}{\code{sp}} and \href{https://www.rdocumentation.org/packages/rgdal/versions/1.3-6}{\code{rgdal}} packages.
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
\details{
All other columns were dropped:

\code{shape_area}, \code{perimeter}, \code{area_num_1}, \code{comarea_id}, \code{comarea}, \code{shape_len}, and \code{area}.
}
\source{
This SpatialPolygonsDataFrame comes from the City of Chicago Data Portal, \href{https://data.cityofchicago.org/Facilities-Geographic-Boundaries/Boundaries-Community-Areas-current-/cauq-8yn6}{
Boundaries - Community Areas (current)}. The file was last updated on December 18, 2018.
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
data("community_areas_spdf")

# plot all 77 community areas
plot(community_areas_spdf
     , main = "Chicago's 77 community areas"
     , col = "gray85"
     , border = "dodgerblue4")
}
\keyword{datasets}
