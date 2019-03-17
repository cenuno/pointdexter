#
# Author:   Cristian E. Nuno
# Purpose:  Label points within polygons
# Date:     March 14, 2019
#

# create LabelPointsWithinPolygons() function -----
#' @export
LabelPointsWithinPolygons <- function(lng
                                      , lat
                                      , polygon.boundaries) {
  # Labels the polygon each coordinate pair lies in
  #
  # Inputs:
  # - lng: a numeric vector of non-NA longitudinal points
  # - lat: a numeric vector of non-NA latiduinal points
  # - polygon.boundaries: either a coordinate pair matrix or
  #                       a named list of coordinate pair matrices

  # Output:
  # if polygon.boundaries is a coordinate pair matrix,
  # a logical vector will be returned identifying
  # those points which lie in the polygon
  #
  # else, a character vector will be returned
  # identifying the polygon each coordinate pair lies in

  # ensure lng is a numeric vector ----
  if (is.numeric(lng) == FALSE) {
    stop("lng must be a numeric vector.")
  }

  # ensure lat is a numeric vector ----
  if (is.numeric(lat) == FALSE) {
    stop("lat must be a numeric vector.")
  }

  # ensure lng and lat are of equal length ----
  if (length(lng) != length(lat)) {
    stop("lng and lat must be of equal length.")
  }

  # ensure lng contains no NA values ---
  if (any(is.na(lng))) {
    stop("Filter lng and lat so that neither contain any NA values.")
  }

  # ensure lat contains no NA values ----
  if (any(is.na(lat))) {
    stop("Filter lng and lat so that neither contain any NA values.")
  }

  # ensure class of polygon.boundaries is a matrix or a list of matrices ----
  if (class(polygon.boundaries) != "matrix") {
    if (!is.list(polygon.boundaries)) {
      stop("polygon.boundaries must either be of class matrix or a list of matrices.\n See ?GetPolygonBoundaries for more information.")
    }
  }

  if (class(polygon.boundaries) != "list") {
    if (!is.matrix(polygon.boundaries)) {
      stop("polygon.boundaries must either be of class matrix or a list of matrices. See ?GetPolygonBoundaries for more information.")
    }
  }

  # if polygon.boundaries is a list, ensure that each matrix is labeled ----
  if (is.list(polygon.boundaries) &
      is.null(names(polygon.boundaries))) {
    stop("Please label the matrices within polygon.boundaries. See ?names for more details.")
  }

  # splancs::inpip() requires the longitude be the first column and latitude the second ----
  # note: df$index will be ignored inside splancs::inpip() as it only subsets the first two columns of pts
  df <-
    data.frame(x = lng, y = lat, index = 1:length(lng))

  # return a logical vector if any points lie within the 1 coordinate pair matrix ----
  if (is.matrix(polygon.boundaries)) {
    return(df$index %in%
             splancs::inpip(pts = df
                            , poly = polygon.boundaries
                            , bound = NULL))
  } else {
    # identify which points lie inside each coordinate pair matrix ----
    temp <-
      lapply(X = polygon.boundaries
             , FUN = function(i)
               splancs::inpip(pts = df
                              , poly = i
                              , bound = NULL))

    # name elements in temp
    names(temp) <- names(polygon.boundaries)

    # collapse the list of indices and polygon labels into one data frame
    # note: instances where no points were found in a polygon will be dropped
    temp <- utils::stack(temp)

    # rename columns
    names(temp)[names(temp) == "values"] <- "index"
    names(temp)[names(temp) == "ind"] <- "label"

    # transfrom the label column from a factor to a character
    temp$label <- as.character(temp$label)

    # test for points that don't exist in any of the polygons ----
    if (nrow(df) > nrow(temp)) {

      no.label.points <-
        data.frame(index = df$index[which(!df$index %in% temp$index)]
          , label = NA)

      temp <- rbind(temp, no.label.points)
    }

    # ensure labels are in the order of the input coordinate pairs ----
    temp <- temp[order(temp$index), ]

    return(temp$label)
  }

} # end of LabelPointsWithinPolygons() function

# end of script #
