pointdexter 0.1.0
=================

## Resubmission
In this version I have:

* Replaced `\dontrun{}` with `\donttest{}` for all `sf` examples in the `.Rd` files.

* Moved `sf` package from Suggests to Enhances in the DESCRIPTION file.
    + This allows the CRAN checks on r-hub to pass with 0 ERRORs, 0 WARNINGs, and 2 NOTEs.

* Removed use of `sf` in the vignette. 

* Removed GPL-3 LICENSE file and mention of it in the DESCRIPTION file.

* Replaced `sf` URLs.

* Replaced broken URLs in `cps_sy1819.rd` file.

## Test environments

* local: macOS High Sierra 10.13.6 install, R 3.5.2

* travis-ci: Ubuntu 14.04.5 LTS, R 3.5.2

* win-builder: x86_64-w64-mingw32 (64-bit) on R-devel (2019-01-09 r75961) and R-release 3.5.2 (2018-12-20)
    + 1 NOTE: new submission

* rhub: Fedora Linux, R-devel, clang, gfortran
    + 2 NOTEs:
        - New submission
        - Package which this enhances but not available for checking: ‘sf’

* rhub: Ubuntu Linux 16.04 LTS, R-release, GCC
    + 2 NOTEs:
        - New submission
        - Package which this enhances but not available for checking: ‘sf’

## R CMD check results
There were no ERRORs, WARNINGs or NOTEs

## Downstream dependencies
I have also run R CMD check on downstream dependencies of pointdexter and all have passed.
