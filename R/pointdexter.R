#' pointdexter: labels longitudinal and latitudinal coordinates located inside a polygon
#'
#' The pointdexter package labels coordinate pairs located inside a polygon.
#' For a singular polygon, the label is a logical vector of TRUE and FALSE values.
#' For multiple polygons, the label is a character vector based on the names of each polygon.
#' The package is designed to work with both \href{https://r-spatial.github.io/sf/}{\code{sf}} and
#'  \href{https://www.rdocumentation.org/packages/sp/versions/1.2-5/topics/SpatialPolygonsDataFrame-class}{\code{SpatialPolygonsDataFrame}} objects.
#'
#' To learn more about pointdexter, start with the vignette:
#' \code{browseVignettes(package = "pointdexter")}
#'
#' @section pointdexter functions:
#' \describe{
#' \item{\code{GetPolygonBoundaries()}}{obtains the boundaries of the polygon(s)}
#' \item{\code{LabelPointsWithinPolygons()}}{labels points located a polygon}
#' }
#'
#' @docType package
#' @name pointdexter
NULL
