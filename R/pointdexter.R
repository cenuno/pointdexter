#' pointdexter: labels longitudinal and latitudinal coordinates located inside a polygon
#'
#' The pointdexter package labels coordinate pairs located inside a polygon.
#' For a singular polygon, the label is a logical vector of TRUE and FALSE values.
#' For multiple polygons, the label is a character vector based on the names of each polygon.
#' The package is designed to work with both 'sf' and SpatialPolygonsDataFrame objects.
#'
#' @section pointdexter functions:
#' GetPolygonBoundaries():      obtains the boundaries of the polygon(s)
#' LabelPointsWithinPolygons(): labels points located a polygon
#'
#' @docType package
#' @name pointdexter
NULL
