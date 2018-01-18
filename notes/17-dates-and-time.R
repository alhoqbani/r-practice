# Working with dates

date()
class(date()) # character

Sys.Date()
class(Sys.Date()) # Date

Sys.time()
class(Sys.time()) # "POSIXct" "POSIXt"


date.string.1 <- '2017-02-14'
class(date.string)
my.date.1 <- as.Date(date.string.1)
class(my.date.1)

date.string.2 <- 'Feb-14-2017'
my.date.2 <- as.Date(date.string.2, format = '%b-%d-%Y')
class(my.date.2)

identical(my.date.1, my.date.2)


# POSIXct
my.date.3 <- as.POSIXct('2017-02-14 11:10:15')
class(my.date.3)
unclass(my.date.3)

help("strptime")
strptime('11:30:45', format = '%H:%M:%S')
as.POSIXct('11:30:45', format = '%H:%M:%S')
as.Date('11:30:45', format = '%H:%M:%S')





# From https://www.stat.berkeley.edu/~s133/dates.html ---------------------
bdays = c(
  tukey = as.Date('1915-06-16'),
  fisher = as.Date('1890-02-17'),
  cramer = as.Date('1893-09-25'),
  kendall = as.Date('1907-09-06')
)

class(bdays)

weekdays(bdays)
months(bdays)

dtimes = c("2002-06-09 12:45:40","2003-01-29 09:30:40",
           "2002-09-04 16:45:40","2002-11-13 20:00:40",
           "2002-07-07 17:30:40")

dtparts = t(as.data.frame(strsplit(dtimes,' ')))
row.names(dtparts) = NULL
thetimes = chron::chron(dates=dtparts[,1],times=dtparts[,2],
                 format=c('y-m-d','h:m:s'))
thetimes

# POSIX
dts = c("2005-10-21 18:47:22","2005-12-24 16:39:58",
        "2005-10-28 07:30:05 PDT")
as.POSIXlt(dts)

# seconds from January 1, 1970, (Convert from epoch to POSIXt)
dts = c(1127056501,1104295502,1129233601,1113547501,
        1119826801,1132519502,1125298801,1113289201)
mydates = dts
class(mydates) = c('POSIXt','POSIXct')
mydates
# This alson can be done in one line:
mydates = structure(dts, class = c('POSIXt', 'POSIXct'))



# From https://r-bloggers.com/using-dates-and-times-in-r/ ------------------

# Standard format
dt1 <- as.Date("2012-07-22")
dt1
# non-standard format
dt2 <- as.Date("04/20/2011", format = "%m/%d/%Y")
dt2

# calculations with dates

# difference between dates
difftime(dt1, dt2, units = "weeks")

# Add or subtract days:
dt2 + 10 # Add 10 days
dt2 - 10 # subtract 10 days

# create a vector of dates and find the intervals between them
three.dates <- as.Date(c("2010-07-22", "2011-04-20", "2012-10-06"))
three.dates
diff(three.dates)

# create a sequence of dates:
(six.weeks <- seq(dt1, length = 6, by = "week"))
(six.weeks <- seq(dt1, length = 6, by = 14))
(six.weeks <- seq(dt1, length = 6, by = "2 weeks"))

# see the internal integer representation
unclass(dt1) # 15543 days since 1970-01-01
dt1 - as.Date("1970-01-01")

# POSIXct

# If you have times in your data, this is usually the best class to use
(tm1 <- as.POSIXct("2013-07-24 23:55:26"))
(tm2 <- as.POSIXct("25072013 08:32:07", format = "%d%m%Y %H:%M:%S"))

# specify the time zone:
(tm3 <- as.POSIXct("2010-12-01 11:42:03", tz = "GMT"))

# some calculations with times

# compare times
tm2 > tm1

# Add or subtract seconds:
tm1 + 30
tm1 - 30

# find the difference between times:
tm2 - tm1

# automatically adjusts for daylight savings time
as.POSIXct("2013-03-10 08:32:07") - as.POSIXct("2013-03-09 23:55:26")

# Get the current time (in POSIXct by default):
Sys.time()

# see the internal integer representation:
unclass(tm1) # Number of seconds since 1970-01-01 00:00:00
difftime(tm1, as.POSIXct("1970-01-01 00:00:00", tz = "UTC"), units = "secs")
  
# POSIXlt
"This class enables easy extraction of specific componants of a time"
"“ct” stand for calender time and “lt” stands for local time. “lt” also helps one remember that POXIXlt objects are lists."

# create a time
(tm1.lt <- as.POSIXlt("2013-07-24 23:55:26"))
str(tm1.lt)
unclass(tm1.lt)
unlist(tm1.lt)

# extract componants of a time object:
tm1.lt$sec
tm1.lt$wday

# truncate or round off the time: (cut the time to the unit)
trunc(tm1.lt, "days") #  one of “secs”, “mins”, “hours”, “days”
trunc(tm1.lt, "mins")



# chron -------------------------------------------------------------------
require(chron)
# This class is a good option when you don’t need to deal with timezones
(tm1.c <- as.chron("2013-07-24 23:55:26"))
(tm2.c <- as.chron("07/25/13 08:32:07", "%m/%d/%y %H:%M:%S"))

# extract just the date
dates(tm1.c)

# compare times:
tm2.c > tm1.c

# add days:
tm1.c + 10

# calculate the differene between times:
tm2.c - tm1.c
difftime(tm2.c, tm1.c, units = "hours")

# Detach the chron package as it will interfere with lubridate
detach("package:chron", unload = TRUE)


# lubridate ---------------------------------------------------------------
library(lubridate)
# This package is a wrapper for POSIXct with more intuitive syntax.

# create a time:
(tm1.lub <- ymd_hms("2013-07-24 23:55:26"))
(tm2.lub <- mdy_hm("07/25/13 08:32"))
(tm3.lub <- ydm_hm("2013-25-07 4:00am"))
(tm4.lub <- dmy("26072013"))
class(tm1.lub)

# some manipulations: extract or reassign componants:

year(tm1.lub)
week(tm1.lub)
wday(tm1.lub, label = TRUE)
hour(tm1.lub)
tz(tm1.lub)
(second(tm2.lub) <- 7)
tm2.lub

# converting to decimal hours can facilitate some types of calculations

(tm1.dechr <- hour(tm1.lub) + minute(tm1.lub)/60 + second(tm1.lub)/3600)

'
Lubridate distinguishes between four types of objects:
1) instants, 2) intervals, 3) duration,  4) and periods.
An instant is a specific moment in time.
Intervals, durations, and periods are all ways of recording time spans.
'

# 1) instants ---

# Dates and times parsed in lubridate are instants:
is.instant(tm1.lub)

# round an instant:
round_date(tm1.lub, "minute")
round_date(tm1.lub, "day")

# get the current time or date as an instant:
now()
today()

# see an instant in a different time zone:
with_tz(tm1.lub, "America/Los_Angeles")

# change the time zone of an instant (keeping the same clock time):
force_tz(tm1.lub, "America/Los_Angeles")

# some calculations with instants. Note that the units are seconds:
tm2.lub - tm1.lub
tm2.lub > tm1.lub
tm1.lub + 30

# 2) interval ---

# An interval is the span of time that occurs between two specified instants.
(in.bed <- as.interval(tm1.lub, tm2.lub))

# Check whether a certain instant occured with a specified interval:
tm3.lub %within% in.bed
tm4.lub %within% in.bed

# determine whether two intervals overlap:

(daylight <- as.interval(ymd_hm("2013-07-25 06:03"), ymd_hm("2013-07-25 20:23")))
int_overlaps(in.bed, daylight)

# 3) duration ---

# A duration is a time span not anchored to specific start and end times. 
# It has an exact, fixed length, and is stored internally in seconds.

# create some durations:
(ten.minutes <- dminutes(10))
(five.days <- ddays(5))
(one.year <- dyears(1))

as.duration(in.bed)

# arithmatic with durations:
tm1.lub - ten.minutes
five.days + dhours(12)
ten.minutes/as.duration(in.bed)


# 4) period ---
# A period is a time span not anchored to specific start and end times,
# and measured in units larger than seconds with inexact lengths. 

# create some periods:
(three.weeks <- weeks(3))
(four.hours <- hours(4))

# arithmatic with periods:
tm4.lub + three.weeks

(sabbatical <- months(6) + days(12))
three.weeks / sabbatical


# Calculating mean clock times
'
we have a vector of clock times in decimal hours, and we want to calculate the mean clock time.
'
(bed.times <- c(23.9,  0.5, 22.7,  0.1, 23.3,  1.2, 23.6))
mean(bed.times) # doesn't work
# The clock has a circular scale, which ends where it begins, so we need to use circular statistics.
require(psych)
circadian.mean(bed.times)

# An example of using times and dates in a data frame
'
Here is a data frame with a week of hypothetical times of going to bed and getting up for one person, and the total amount of time sleep time obtained each night according to a sleep monitoring device.
'

sleep <-
  data.frame(
    bed.time = ymd_hms(
      "2013-09-01 23:05:24",
      "2013-09-02 22:51:09",
      "2013-09-04 00:09:16",
      "2013-09-04 23:43:31",
      "2013-09-06 00:17:41",
      "2013-09-06 22:42:27",
      "2013-09-08 00:22:27"
    ),
    rise.time = ymd_hms(
      "2013-09-02 08:03:29",
      "2013-09-03 07:34:21",
      "2013-09-04 07:45:06",
      "2013-09-05 07:07:17",
      "2013-09-06 08:17:13",
      "2013-09-07 06:52:11",
      "2013-09-08 07:15:19"
    ),
    sleep.time = dhours(c(6.74, 7.92, 7.01, 6.23, 6.34,
                          7.42, 6.45))
  )
sleep

# calculate sleep efficiency, the percent of time in bed spent asleep.
sleep$efficiency <-
  round(sleep$sleep.time / (sleep$rise.time - sleep$bed.time) *
          100, 1)
sleep

# calculate the mean of each column
colMeans(sleep)  # doesn't work

circadian.mean(hour(sleep$bed.time) + minute(sleep$bed.time) / 60 + second(sleep$bed.time) / 3600)

circadian.mean(hour(sleep$rise.time) + minute(sleep$rise.time) / 60 + second(sleep$rise.time) /
                 3600)



# Formating dates ---------------------------------------------------------
d1 <- Sys.time()


format(d1, '%a %b %d')
format(d1, '%d/%m/%Y')

x <- c('11jan1990', '12jan1990', '13jan1990', '14jan1990')
z <- as.Date(x, '%d%b%Y') # You have to explain the structure of your date input
dt3 <- as.Date("October 6, 2010", format = "%B %d, %Y")
dt3
?strptime
strptime("October 6, 2010", format = "%B %d, %Y")


# Printing Dates
format(z, '%y/%m/%d')
z <- z + 1 # Add on day to each Date in z

z[1] - z[2] # Date difference between first and second date
as.numeric(z[1] - z[2]) # The difference as number



# Built functions to return information about date object
(d2 <- Sys.Date())

weekdays(d2)
weekdays(d2, abbreviate = T)
months(d2)
months(d2, abbreviate = T)
quarters(d2)
julian(d2) # number of seconds since "1970-01-01"

# Lubridate
library(lubridate)
help(package = lubridate)
?ymd
?ymd_hms

# Convert integers/characters into date
ymd(19850501)
class(ymd(19850501)) # Date
dmy('15/02/1990')
mdy_hms('02/15/1990 15:30:29')
# With timezone
mdy_hms('02/15/1990 15:30:29', tz = 'America/Los_Angeles')
mdy_hms('02/15/1990 15:30:29', tz = 'Asia/Riyadh')

?Sys.timezone


# From the docs
(z <- Sys.time())             # the current date, as class "POSIXct"

Sys.time() - 3600             # an hour ago

as.POSIXlt(Sys.time(), "GMT") # the current time in GMT
format(.leap.seconds)         # the leap seconds in your time zone
print(.leap.seconds, tz = "PST8PDT")  # and in Seattle's

## look at *internal* representation of "POSIXlt" :
leapS <- as.POSIXlt(.leap.seconds)
names(leapS) ; is.list(leapS)
## str() "too smart" -->  need unclass(.):
utils::str(unclass(leapS), vec.len = 7)


(today <- Sys.Date())
format(today, "%d %b %Y")  # with month as a word
(tenweeks <- seq(today, length.out=10, by="1 week")) # next ten weeks
weekdays(today)
months(tenweeks)
as.Date(.leap.seconds)


# Resources ---------------------------------------------------------------

links <- c(
  'https://www.r-bloggers.com/using-dates-and-times-in-r/',
  'https://www.r-statistics.com/2012/03/do-more-with-dates-and-times-in-r-with-lubridate-1-1-0/',
  'https://www.stat.berkeley.edu/~s133/dates.html'
)
