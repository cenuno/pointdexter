\name{census_tracts_sf}
\alias{census_tracts_sf}
\docType{data}
\title{
A simple feature of the 2010 Chicago census tracts
}
\description{
A simple feature containing the 2010 Chicago census tracts that can only be used with the \href{https://r-spatial.github.io/sf/}{\code{sf}} package.
}
\usage{data("census_tracts_sf")}
\format{
  A simple feature (which is either \code{data.frame} or \code{tibble}) with a geometry list-column with 801 observations on the following 10 variables:
  \describe{
    \item{\code{statefp10}}{17, a 2-digit code from the American National Standards Institute/Federal Information Processing Standards (ANSI/FIPS) that represents the State of Illinois}
    \item{\code{name10}}{un-padded 3-to-6 digit (excluding the decimal point) name of the census tract}
    \item{\code{commarea_n}}{numeric name of the community area that the census tract lays within, which can be used as a crosswalk to identify particular census tracts in a given community area}
    \item{\code{namelsad10}}{character name of the census tract}
    \item{\code{commarea}}{numeric name of the community area that the census tract lays within, which can be used as a crosswalk to identify particular census tracts in a given community area}
    \item{\code{geoid10}}{11-digit code that unique identifies the census tract as a concatenation of \code{statefp10} (2-digits) + \code{countyfp10} (3-digits) + \code{tractce} (6-digits)}
    \item{\code{notes}}{not every census tract lays exactly within a community area which is where the City of Chicago made notes regarding instances of overlap, low population, or a census tract falling outside the City's boundaries}
    \item{\code{tractce10}}{padded 6-digit name of the census tract}
    \item{\code{countyfp10}}{3-digit county name for Cook County}
    \item{\code{geometry}}{a list that contains the dimensions and the simple feature geometry type}
  }
}
\details{
The following is \code{sf} installation advice from \href{https://nycgeo.mattherman.info/}{Matt Herman}:


Depending on your operating system and available libraries, \code{sf} can be tricky to install the first time. The \href{https://r-spatial.github.io/sf/index.html#installing}{\code{sf} website} is a good place to start if you're having trouble. If you're using macOS, \href{https://medium.com/@jinwujour/mapping-with-r-on-mac-installation-8c8ef997c6c2}{this is a good guide} to installing the required libraries.
}
\source{
This \code{sf} object comes from the City of Chicago Data Portal, \href{https://data.cityofchicago.org/Facilities-Geographic-Boundaries/Boundaries-Census-Tracts-2010/5jrd-6zik}{
Boundaries - Census Tracts - 2010}. The file was last updated on July 11, 2018.
}
\references{
\href{https://r-spatial.github.io/sf/}{\code{sf}} documentation has helpful information on how to work with \code{sf} objects.
}
\examples{
\donttest{
# load necessary packages ----
library(sf)

# load necessary data ----
data("census_tracts_sf")

# plot Chicago 2010 census tracts ----
par(mar = c(0, 0, 1, 0))

plot(census_tracts_sf$geometry
     , main = "2010 City of Chicago census tracts"
     , col = "gray85"
     , border = "dodgerblue4")
     }
}
\seealso{
\itemize{
\item \code{?pointdexter::census_tracts_spdf}
}
}
\keyword{datasets}
