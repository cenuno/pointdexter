# pointdexter 0.1.1

* Added 2010 Chicago census tracts as built-in data sets as both `sf` and `SpatialPolygonDataFrame` objects
* Fixed an error where `LabelPointsWithinPolygons()` failed when no point(s) lay within a polygon. 
    + By using smaller geographies (i.e. [census tracts](https://www.census.gov/geo/reference/gtc/gtc_ct.html)) rather than larger ones (i.e. [community areas](http://www.encyclopedia.chicagohistory.org/pages/319.html)), `pointdexter`'s 0.1.0 method of labeling did not account for instances where a polygon has no points laying inside of it.
    + Resolved by storing the results of [`splancs::inpip()`](https://www.rdocumentation.org/packages/splancs/versions/2.01-40/topics/inpip) for each polygon as a named integer vector in a list rather than in a data frame.

# pointdexter 0.1.0

* Added a `NEWS.md` file to track changes to the package.
