#
# Author:   Cristian E. Nuno
# Purpose:  Export raw data sets as compressed .rda files
# Date:     March 14, 2019
#

# load necessary packages ----
# note: as the world moves forward with the `sf` package
#       I will save internal data as both sf and spdf objects
library(sf)
library(rgdal)

# load all objects ----
community_areas_spdf <- readOGR(dsn = "data-raw/chicago_community_area_boundaries.geojson"
                                , stringsAsFactors = FALSE)
community_areas_sf   <- read_sf("data-raw/chicago_community_area_boundaries.geojson")

city_boundary_spdf   <- readOGR(dsn = "data-raw/chicago_city_boundary.geojson"
                                , stringsAsFactors = FALSE)

city_boundary_sf     <- read_sf("data-raw/chicago_city_boundary.geojson")

cps_sy1819           <- read.csv("data-raw/chicago_public_schools_sy1819.csv"
                                 , stringsAsFactors = FALSE
                                 , na.strings = "")
census_tracts_spdf   <- readOGR(dsn = "data-raw/chicago_2010_census_tracts.geojson"
                                , stringsAsFactors = FALSE)
census_tracts_sf     <- read_sf("data-raw/chicago_2010_census_tracts.geojson")

# clean community_areas_spdf ----
# note: all other columns but community & area number are either zero or irrelevant
community_areas_spdf <-
  community_areas_spdf[, c("community", "area_numbe")]

# clean community_areas_sf -----
# note: keeping only the community, area number and geometry columns
community_areas_sf <-
  community_areas_sf[, c("community", "area_numbe", "geometry")]

# clean cps_sy1819 ----
names(cps_sy1819) <- tolower(names(cps_sy1819))

# store columns where values are 'true' or 'false'
tf.char.columns <-
  c("is_high_school", "is_middle_school", "is_elementary_school"
    , "is_pre_school", "attendance_boundaries", "dress_code"
    , "bilingual_services", "refugee_services", "title_1_eligible"
    , "significantly_modified", "hard_of_hearing", "visual_impairments"
    , "is_gocps_participant", "is_gocps_prek", "is_gocps_elementary"
    , "is_gocps_high_school")

# replace character values with logical values
cps_sy1819[, tf.char.columns] <-
  lapply(X = cps_sy1819[, tf.char.columns], FUN = as.logical)

# store columns where values are 'Y'
yes.char.columns <-
  c("preschool_inclusive", "preschool_instructional")

# replace character values with logical values
cps_sy1819[, yes.char.columns] <-
  lapply(X = cps_sy1819[, yes.char.columns]
         , FUN = function(i) ifelse(i == "Y", TRUE, i))

# store all non-administrator contacts & titles
non.administrator.contacts.titles <-
  names(cps_sy1819)[grepl("contact", names(cps_sy1819))]

# only keep columns that aren't in non.administrator.contacts.titles vector
cps_sy1819 <-
  cps_sy1819[, !names(cps_sy1819) %in% non.administrator.contacts.titles]

# drop the act columns since every record is NA
act <-
  names(cps_sy1819)[grepl("_act", names(cps_sy1819))]

cps_sy1819 <-
  cps_sy1819[, !names(cps_sy1819) %in% act]

# drop the closed_for_enrollment_date since every record is NA
closed <-
  "closed_for_enrollment_date"

cps_sy1819 <-
  cps_sy1819[, !names(cps_sy1819) %in% closed]

# Englewood STEM HS has the incorrect
# graduation rate mean and college enrollment rate mean rates
cps_sy1819$graduation_rate_mean <-
  ifelse(cps_sy1819$graduation_rate_mean == 77.5
         , 78.2
         , cps_sy1819$graduation_rate_mean)

cps_sy1819$college_enrollment_rate_mean <-
  ifelse(cps_sy1819$college_enrollment_rate_mean == 59.8
         , 68.2
         , cps_sy1819$college_enrollment_rate_mean)

# cast overall_rating as a factor so
# that school quality rating policy (SQRP) ranking is upheld
cps_sy1819$overall_rating <-
  factor(cps_sy1819$overall_rating
         , levels = c("Level 1+"
                      , "Level 1"
                      , "Level 2+"
                      , "Level 2"
                      , "Level 3"
                      , "Inability to Rate"))

# for no reason, the data is missing the school type field from SY1617
# and has replaced it with the lenghtly classification_description column
# thankfully, they used the exact same text as before so
# the values can be mapped perfectly
cps_sy1617 <-
  readRDS(gzcon(url("https://github.com/cenuno/Learning_R/raw/master/write_data/clean_rating_cps_sy1617_school_profiles.rds")))

classification.type <-
  as.data.frame(table(cps_sy1617$School_Type
                      , cps_sy1617$Classification_Description))

names(classification.type) <-
  c("classification_type"
    , "classification_description_sy1617"
    , "n")

classification.type <-
  classification.type[classification.type$n > 0, ]

# add the classification_type to cps_sy1819
cps_sy1819 <-
  merge(x = cps_sy1819
        , y = classification.type
        , by.x = "classification_description"
        , by.y = "classification_description_sy1617"
        , all.x = TRUE)

# remove the 'n' column so it's no longer relevant
cps_sy1819$n <- NULL

# note: base::merge() rearranged the columns so I'm manually arranging them here
cps_sy1819 <-
  cps_sy1819[c(2:73, 81, 1, 74:80)]

# transform open enrollment date to Date object
cps_sy1819$open_for_enrollment_date <-
  as.Date(cps_sy1819$open_for_enrollment_date, format = "%m/%d/%Y")

# remove the closed_for_enrollment_date since it's all NA values
cps_sy1819$closed_for_enrollment_date <- NULL

# cast school_id as a character vector
cps_sy1819$school_id <- as.character(cps_sy1819$school_id)

# ensure a few text columns are encoded as UTF-8
for (i in c("long_name", "summary", "administrator"
            , "statistics_description", "demographic_description"
            , "rating_statement", "classification_description")) {
  Encoding(cps_sy1819[[i]]) <- "UTF-8"
}

# clean census tracts ----
census_tracts_sf$notes <-
  # replace "" with NA values in the notes column
  ifelse(census_tracts_sf$notes == "", NA, census_tracts_sf$notes)

census_tracts_spdf@data$notes <-
  # replace "" with NA values in the notes column
  ifelse(census_tracts_spdf@data$notes == ""
         , NA
         , census_tracts_spdf@data$notes)

# export all objects as .rda files in data/ -----
save(community_areas_spdf
     , file = "data/community_areas_spdf.rda"
     , compress = "xz")
save(community_areas_sf
     , file = "data/community_areas_sf.rda"
     , compress = "xz")
save(city_boundary_spdf
     , file = "data/city_boundary_spdf.rda"
     , compress = "xz")
save(city_boundary_sf
     , file = "data/city_boundary_sf.rda"
     , compress = "xz")
save(cps_sy1819
     , file = "data/cps_sy1819.rda"
     , compress = "bzip2")
save(census_tracts_spdf
     , file = "data/census_tracts_spdf.rda"
     , compress = "xz")
save(census_tracts_sf
     , file = "data/census_tracts_sf.rda"
     , compress = "xz")

# end of script #
