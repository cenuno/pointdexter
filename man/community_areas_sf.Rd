\name{community_areas_sf}
\alias{community_areas_sf}
\docType{data}
\title{
Chicago's 77 community areas
}
\description{
A simple feature of the 77 community area boundaries in Chicago that can only be used with the \href{https://r-spatial.github.io/sf/}{\code{sf}} package.
}
\usage{data("community_areas_sf")}
\format{
  A simple feature (which is either \code{data.frame} or \code{tibble}) with a geometry list-column with 77 observations on the following 3 variables:
  \describe{
    \item{\code{community}}{the name of each community area}
    \item{\code{area_numbe}}{the area number for each community(identical to \code{area_num_1})}
    \item{\code{geometry}}{a list that contains the dimensions and the simple feature geometry type}
  }
}
\details{
The following is \code{sf} installation advice from \href{https://nycgeo.mattherman.info/}{Matt Herman}:


Depending on your operating system and available libraries, \code{sf} can be tricky to install the first time. The \href{https://r-spatial.github.io/sf/index.html#installing}{\code{sf} website} is a good place to start if you're having trouble. If you're using macOS, \href{https://medium.com/@jinwujour/mapping-with-r-on-mac-installation-8c8ef997c6c2}{this is a good guide} to installing the required libraries.
}
\source{
This data frame comes from the City of Chicago Data Portal, \href{https://data.cityofchicago.org/Facilities-Geographic-Boundaries/Boundaries-Community-Areas-current-/cauq-8yn6}{
Boundaries - Community Areas (current)}. The file was last updated on December 18, 2018.
}
\references{
\href{https://r-spatial.github.io/sf/}{\code{sf}} documentation has helpful information on how to work with \code{sf} objects.
}
\examples{
\donttest{
# load necessary packages ----
library(sf)

# load necessary data ----
data("community_areas_sf")

# plot all 77 community areas -----
par(mar = c(0, 0, 1, 0))

plot(community_areas_sf$geometry
     , main = "Chicago's 77 community areas"
     , col = "gray85"
     , border = "dodgerblue4")
     }
}
\seealso{
\itemize{
\item \code{?pointdexter::community_areas_spdf}
}
}
\keyword{datasets}
