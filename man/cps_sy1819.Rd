\name{cps_sy1819}
\alias{cps_sy1819}
\docType{data}
\title{
Chicago Public Schools (CPS) - School Profile Information, School Year (SY) 2018-2019
}
\description{
School profile information for all schools in the Chicago Public School district for the school year 2018-2019.
}
\usage{data("cps_sy1819")}
\format{
A data frame of 660 observations - one record per school - on the following 81 variables:
  \describe{
    \item{\code{school_id}}{current 6-digit unique ID assigned to each school}
    \item{\code{legacy_unit_id}}{outdated 4-digit unique ID assigned to each school}
    \item{\code{finance_id}}{5-digit unique ID assigned to each school (note that Englewood STEM High School has a value of 0 due to the fact that it is a new school set to open in the fall of 2019)}
    \item{\code{short_name}}{nickname of each school}
    \item{\code{long_name}}{formal name of each school}
    \item{\code{primary_category}}{primary grade levels served (ES for elementary, MS for middle, and HS for high school). Note that a school can possess any of these three values and still serve students the other two values.}
    \item{\code{is_high_school}}{T/F if school serves any 9-12th graders}
    \item{\code{is_middle_school}}{T/F if school serves any 6-8th graders}
    \item{\code{is_elementary_school}}{T/F if school serves any Kindergarten-5th graders}
    \item{\code{is_pre_school}}{T/F if school serves Pre-Kindergarteners}
    \item{\code{summary}}{text description of the school's mission and values}
    \item{\code{administrator_title}}{either Principal or Director}
    \item{\code{administrator}}{first and last name of school's administrator}
    \item{\code{address}}{school's address}
    \item{\code{city}}{city the school resides in (all Chicago)}
    \item{\code{state}}{state the school resides in (all Illinois)}
    \item{\code{zip}}{5-digit postal code used by the United States Postal Services}
    \item{\code{phone}}{10-digit phone number}
    \item{\code{fax}}{10-digit fax number used for telephonic transmission of scanned printed material}
    \item{\code{cps_school_profile}}{URL to a CPS provided web-page that provides an overview of the school}
    \item{\code{website}}{URL to school's home page}
    \item{\code{facebook}}{URL to school's Facebook page}
    \item{\code{twitter}}{URL to school's Twitter page}
    \item{\code{youtube}}{URL to a school's YouTube page}
    \item{\code{pinterest}}{URL to school's Pinterest page}
    \item{\code{attendance_boundaries}}{T/F if school has attendance boundaries (type in address \href{https://cps.edu/ScriptLibrary/Map-SchoolLocator/index.html}{here} to see an example attendance boundary.)}
    \item{\code{grades_offered_all}}{grades offered by school, separated by a comma (i.e. 1,2,3)}
    \item{\code{grades_offered}}{grades offered by school, shortened by a dash (i.e. 1-3)}
    \item{\code{student_count_total}}{total number of students}
    \item{\code{student_count_low_income}}{number of low income students}
    \item{\code{student_count_special_ed}}{total number of students}
    \item{\code{student_count_english_learners}}{number of low income students}
    \item{\code{student_count_black}}{total number of African-American students}
    \item{\code{student_count_hispanic}}{total number of Hispanic students}
    \item{\code{student_count_white}}{total number of White students}
    \item{\code{student_count_asian}}{total number of Asian students}
    \item{\code{student_count_native_american}}{total number of Native-American students}
    \item{\code{student_count_other_ethnicity}}{total number of students whose race/ethnicity is 'Other'}
    \item{\code{student_count_asian_pacific_islander}}{total number of Asian/Pacific-Islander students}
    \item{\code{student_count_multi}}{total number of multi-racial/ethnic students}
    \item{\code{student_count_hawaiian_pacific_islander}}{total number of Hawaiian/Pacific-Islander students}
    \item{\code{student_count_ethnicity_not_available}}{total number of students whose ethnicity was not available}
    \item{\code{statistics_description}}{text description about the total student count, percent low income, percent diverse learners, and percent limited english learners}
    \item{\code{demographic_description}}{text description stating both the largest and second largest racial/ethnic demographic group}
    \item{\code{dress_code}}{T/F if school institutes a dress code}
    \item{\code{prek_school_day}}{pre-k school day description}
    \item{\code{kindergarten_school_day}}{kindergarten school days are all full days}
    \item{\code{school_hours}}{start and end time of school day (not a datetime)}
    \item{\code{freshman_start_end_time}}{start and end time of for freshman (not a datetime)}
    \item{\code{after_school_hours}}{start and end time of after school hours (not a datetime)}
    \item{\code{earliest_drop_off_time}}{earliest drop off time (not a datetime)}
    \item{\code{classroom_languages}}{non-English languages spoken in classroom, separated by a comma}
    \item{\code{bilingual_services}}{T/F if school offers bilingual services}
    \item{\code{refugee_services}}{T/F if school offers refugee services}
    \item{\code{title_1_eligible}}{T/F if school is eligible for \href{https://www2.ed.gov/programs/titleiparta/index.html}{Title 1} federal funds}
    \item{\code{preschool_inclusive}}{T/F if pre-school is inclusive}
    \item{\code{preschool_instructional}}{T/F if pre-school is instructional}
    \item{\code{significantly_modified}}{T/F if school offers \href{https://cps.edu/diverselearners/Pages/ServicesandPrograms.aspx}{services} that provide students who need focused and very specific medical issues to supports for different learning styles and difficulties}
    \item{\code{hard_of_hearing}}{T/F if school offers curriculum for deaf and hard-of-hearing (HOH) students}
    \item{\code{visual_impairments}}{T/F if school offers curriculum for visually impaired students}
    \item{\code{transportation_bus}}{\href{http://www.ctabustracker.com/bustime/map/displaymap.jsp}{CTA} bus routes near the school (only route numbers)}
    \item{\code{transportation_el}}{\href{https://www.transitchicago.com/schedules/}{CTA} 'L' train lines near the school (only the color(s) and not the exact stations)}
    \item{\code{transportation_metra}}{\href{https://metrarail.com/maps-schedules}{Metra} train routes near the school}
    \item{\code{school_latitude}}{\href{https://www.bbc.com/bitesize/guides/ztqtyrd/revision/1}{east-wide direction} of the school (ranges from 41.65 to 42.02)}
    \item{\code{school_longitude}}{\href{https://www.bbc.com/bitesize/guides/ztqtyrd/revision/1}{north-south direction} of the school (ranges from -87.84 to -87.52)}
    \item{\code{college_enrollment_rate_school}}{college enrollment rates reflect the percent of CPS graduates who enrolled in college by the fall of their graduating year. CPS receives college enrollment data from the \href{https://studentclearinghouse.org/about/}{National Student Clearinghouse (NSC)}}
    \item{\code{college_enrollment_rate_mean}}{the mean college enrollment rate is 68.2 percent}
    \item{\code{graduation_rate_school}}{high school graduation rate}
    \item{\code{graduation_rate_mean}}{the mean high school graduation rate is 78.2 percent}
    \item{\code{overall_rating}}{\href{https://cps.edu/Performance/Documents/SQRP_Overview.pdf}{school quality rating policy (SQRP)} rating, with Level 1+ being the highest performance and Level 3 being the lowest}
    \item{\code{rating_status}}{a \href{https://cps.edu/Performance/Documents/SQRP_Overview.pdf}{school’s status} determines who has decision-making power at the school level}
    \item{\code{rating_statement}}{text description of the value in \code{overall_rating}}
    \item{\code{classification_type}}{12 different types of school admission processes and curriculum}
    \item{\code{classification_description}}{text description of \code{classification_type}}
    \item{\code{school_year}}{School Year 2018-2019}
    \item{\code{network}}{District-run schools in CPS are organized into geographic \href{https://data.cityofchicago.org/Education/Chicago-Public-Schools-Geographic-Networks/3y7n-mx9t}{networks}, which provide administrative support, strategic direction, and leadership development to the schools within each network}
    \item{\code{is_gocps_participant}}{\href{https://go.cps.edu/}{GoCPS} allows families to learn, research, explore, and apply to nearly every CPS school and program through one online platform}
    \item{\code{is_gocps_prek}}{T/F if school serves Pre-Kindergarteners and is on GoCPS}
    \item{\code{is_gocps_elementary}}{T/F if school serves elementary grade students and is on GoCPS}
    \item{\code{is_gocps_high_school}}{T/F if school serves high school students and is on GoCPS}
    \item{\code{open_for_enrollment_date}}{open enrollment date}
  }
}
\details{
This data frame does not contain all columns from the source file. The following columns were dropped due to irrelevance or all schools containing NA values:

\code{average_act_school}, \code{mean_act}, \code{x_contact_name}, \code{x_contact_title}, and \code{closed_for_enrollment_date}.
}
\source{
This data frame comes from the City of Chicago Data Portal, \href{https://data.cityofchicago.org/Education/Chicago-Public-Schools-School-Profile-Information-/kh4r-387c}{Chicago Public Schools - School Profile Information SY1819}. The file was last updated on December 29, 2018.
}
\examples{
# load the necessary data -----
data("cps_sy1819")
}
\keyword{datasets}
