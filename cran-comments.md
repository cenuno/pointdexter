pointdexter 0.1.0
=================

## Resubmission
In this version I have:

* Confirmed that the package `sf` - listed under Suggestions in the DESCRIPTION file - fails to install due to its configuration requirements.

* Unable to identify where I place `_R_CHECK_FORCE_SUGGESTS_` to FALSE to avoid having `sf` being checked when releasing to CRAN. Creating a `.Rprofile` file within the `pointdexter` directory did not help me pass the build environments from `devtools::check_rhub()`.

* Unsure if next steps would require me to copy and paste the DOCKERFILE's in [sf/inst/docker](https://github.com/r-spatial/sf/tree/master/inst/docker#build-and-check-sf-against-r-release-and-r-devel)

* Removed use of `sf` in the vignette. 

* `sf` examples in the `.Rd` files will no longer be run, courtesy of `\dontrun{}`.

* Removed GPL-3 LICENSE file and mention of it in the DESCRIPTION file.

* Replaced `sf` URLs.

## Passed test environments
* local: macOS High Sierra 10.13.6 install, R 3.5.2
* travis-ci: Ubuntu 14.04.5 LTS, R 3.5.2
* win-builder: x86_64-w64-mingw32 (64-bit) on R-devel (2019-01-09 r75961) and R-release 3.5.2 (2018-12-20)
    + 1 NOTE: new submission

## Failed Test environments

* Fedora Linux, R-devel, clang, gfortran
    + 1 ERROR: checking package dependencies ... ERROR. Package suggested but not available: ‘sf’
    + 1 NOTE: new submission
    
* Ubuntu Linux 16.04 LTS, R-release, GCC
    + 1 ERROR: checking package dependencies ... ERROR. Package suggested but not available: ‘sf’
    + 1 NOTE: new submission

## R CMD check results
There were no ERRORs, WARNINGs or NOTEs

## Downstream dependencies
I have also run R CMD check on downstream dependencies of pointdexter and all have passed.

## Failed Checks

* sf (failed to install)
