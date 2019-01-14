pointdexter 0.1.0
=================

## Resubmission
This is a third resubmission. In this version I have:

* Confirmed that the package `sf` - listed under Suggestions in the DESCRIPTION file - fails to install due to its configuration requirements.

* Removed use of `sf` in the vignette. 

* `sf` examples in the `.Rd` files will no longer be run, courtesy of `\dontrun{}`.

* Removed GPL-3 LICENSE file and mention of it in the DESCRIPTION file.

* Replaced `sf` URLs.

## Test environments
* local: macOS High Sierra 10.13.6 install, R 3.5.2
* travis-ci: Ubuntu 14.04.5 LTS, R 3.5.2
* win-builder: x86_64-w64-mingw32 (64-bit) on R-devel (2019-01-09 r75961) and R-release 3.5.2 (2018-12-20)

### Note

New submission

## R CMD check results
There were no ERRORs, WARNINGs or NOTEs

## Downstream dependencies
I have also run R CMD check on downstream dependencies of pointdexter and all have passed.

## Failed Checks

* sf (failed to install)
