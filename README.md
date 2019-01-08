# pointdexter

<!-- badges: start -->
[![Travis build status](https://travis-ci.org/cenuno/pointdexter.svg?branch=master)](https://travis-ci.org/cenuno/pointdexter)
<!-- badges: end -->

The package labels coordinate pairs located inside a polygon.

## Description

Two common spatial elements used in data analysis are points and polygons:

* points represent longitudinal and latitudinal coordinates, a unique pair that specifies a specific place; and

* polygons represent natural or artificial borders used to distinguish boundaries across geographies. 

The `pointdexter` package labels longitudinal and latitudinal coordinates located inside a polygon.

## Spatial Packages

The package is designed to work with both [sf](https://r-spatial.github.io/sf/) and [SpatialPolygonsDataFrame](https://www.rdocumentation.org/packages/sp/versions/1.2-5/topics/SpatialPolygonsDataFrame-class) objects.

By default, `pointdexter` only installs the [`sp`](https://www.rdocumentation.org/packages/sp/versions/1.3-1) package. However, it also works with the `sf` package.

## Installation

Install developmental versions of `pointdexter` on GitHub:

```R
# install the pointdexter package without the vignette
devtools::install_github("cenuno/pointdexter")

# note: if you choose to build the vignettes when you install
#       the 'sf' package will be installed
devtools::install_github("cenuno/pointdexter", build_vignettes = TRUE)
```

## Resources

After you've installed the package, be sure to view the guide that introduces you to `pointdexter`'s two functions:

1. `GetPolygonBoundaries()`; and
2. `LabelPointsWithinPolygons()`

```R
# open a browser window to view an HTML version of the vignette
browseVignettes("pointdexter")

# view the vignette in your RStudio viewer
vignette("introduction-to-pointdexter", "pointdexter")
```

## Feedback

### Cite

If you use `pointdexter` for any analysis, I would love to hear about it! You can also cite the package according to `citation("pointdexter")`.

### Contribute

[Issues](https://github.com/cenuno/pointdexter/issues) and [pull requests](https://github.com/cenuno/pointdexter/pulls) are welcome anytime!
