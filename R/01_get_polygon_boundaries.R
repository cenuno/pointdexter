#
# Author:   Cristian E. Nuno
# Purpose:  Retrieve coordinate pairs from each polygon in a spatial polygon data frame
# Date:     December 28, 2018
#

# create GetPolygonBoundaries() function -----
#' @export
GetPolygonBoundaries <- function(my.polygon
                                 , labels = NULL) {
  # Obtains the boundaries of the polygon(s)
  #
  # Input: ----
  # my.polygon: either a spatial polygons data frame or a sf object
  # labels: a character vector of polygon boundary labels used to name each matrix

  # Output: ----
  # If my.polygon is of length 1, a coordinate pair matrix;
  # else a list of labeled matrices,
  # with each matrix representing the coordinate pairs
  # that make the boundary of each particular polygon.
  # Each matrix containing a unique record for every unique coordinate pair
  # longitude is the first column and latitude is the second column

  # ensure my.polygon is correct class -----
  if (!any(class(my.polygon) %in%
          c("sf", "SpatialPolygonsDataFrame"))) {
    stop("my.polygon is of class "
          , class(my.polygon)[1]
          , ". Please ensure it is of class SpatialPolygonsDataFrame or sf.\n\nSee ?sp::`SpatialPolygonsDataFrame-class` or vignette('sf1', 'sf') for more help.")
  }

  # ensure that if my.polygon is an sf object, that the sf package is installed -----
  if (class(my.polygon)[1] == "sf" &
      requireNamespace("sf", quietly = TRUE) == FALSE) {
    stop("my.polygon is of class sf yet you do not have the sf package.\n\nEither install the sf package - install.packages('sf') - or input a SpatialPolygonsDataFrame object into my.polygon.")
  }

  # ensure that labels is a character vector ----
  if (!is.null(labels) & !is.character(labels)) {
    stop("labels must be a character vector.")
  }

  # print message that labels won't be used with one polygon ----
  if (nrow(my.polygon) == 1 & !is.null(labels)) {
    message("No label is assigned to my.polygon of length 1.")
  }

  # ensure that labels is same number of rows as my.polygon ----
  if (!is.null(labels) &
      length(labels) != nrow(my.polygon)) {
    stop("The number of elements in labels must equal the number of rows in my.polygon.")
  }

  # if there is only 1 polygon, retrieve its coordinate pair matrix ----
  if (nrow(my.polygon) == 1) {
    if (class(my.polygon)[1] == "SpatialPolygonsDataFrame") {
      polygon.boundary <-
        lapply(X = my.polygon@polygons[[1]]@Polygons
               , FUN = function(i) i@coords)
    } else {
      polygon.boundary <-
        lapply(X = sf::st_boundary(my.polygon$geometry)[[1]]
               , FUN = function(i) i)
    }
    # to account for holes in a polygon, only extract the coordinate pair matrix with the most points
    max.poly <- which.max(sapply(X = polygon.boundary, FUN = nrow))

    return(polygon.boundary[[max.poly]])
    # if this is more than 1 polygon, retrieve each polygon's coordinate pair matrix ----
  } else {
    if (class(my.polygon)[1] == "SpatialPolygonsDataFrame") {
      polygon.boundaries <-
        lapply(X = my.polygon@polygons
               , FUN = function(i)
                 i@Polygons[[1]]@coords)
    } else {
      polygon.boundaries <-
        lapply(X = sf::st_boundary(my.polygon$geometry)
               , FUN = function(i) i[[1]])
    }
    if (!is.null(labels)) {
      names(polygon.boundaries) <- labels
    }
    return(polygon.boundaries)
  }
} # end of GetPolygonBoundaries() function

# end of script #
