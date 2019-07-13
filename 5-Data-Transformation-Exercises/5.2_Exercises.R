library(tidyverse)
library(nycflights13)

#5.2.3 Missing Values
df <- tibble(x = c(1, NA, 3))
filter(df, x > 1)
filter(df, is.na(x) | x > 1)

#5.2.4 Exercises

#5.2.4.1.1 Find all flights that had an arrival delay of two or more hours
filter(flights, arr_delay >= 120)

#5.2.4.1.2 Find all flights that flew to Houston (IAH or HOU)
filter(flights, dest %in% c("IAH", "HOU"))
filter(flights, dest == "IAH" | dest == "HOU")

#5.2.4.1.3 Find all flights that Were operated by United, American, or Delta
filter(flights, carrier %in% c("AA", "DL", "UA"))
filter(flights, carrier == "UA" | carrier == "AA" | carrier == "DL")

#5.2.4.1.4 Find all flights that Departed in summer (July, August, and September)
filter(flights, month >= 7 & month <= 9)
filter(flights, month %in% c(7, 8, 9))

#5.2.4.1.5 Find all flights that arrived more than two hours late, but didn't leave late
filter(flights, arr_delay > 120, dep_delay <= 0)
filter(flights, arr_delay > 120 & dep_delay <= 0)

#5.2.4.1.6 Find all flights that Were delayed by at least an hour, but made up over 30 minutes in flight
filter(flights, arr_delay > 60 & dep_delay - arr_delay < 30)

#5.2.4.1.7 Find all flights that departed between midnight and 6am (inclusive)
summary(flights$dep_time)
filter(flights, dep_time <= 600 | dep_time == 2400)

#5.2.4.2 Another useful dplyr filtering helper is between(). What does it do? Can you use it to simplify the code needed to answer the previous challenges?
#between(x, left, right) = x >= left & x <= right
#(5.2.4.1.4 Find all flights that Departed in summer (July, August, and September))
filter (flights, between(month, 7, 9))

#5.2.4.3 How many flights have a missing dep_time? What other variables are missing? What might these rows represent? 
#These flights are also missing arrival and air times and most likely didn't take off at all
view(filter(flights, is.na(dep_time)))

#5.2.4.4 Why is NA ^ 0 not missing? Why is NA | TRUE not missing? Why is FALSE & NA not missing? Can you figure out the general rule? (NA * 0 is a tricky counterexample!)
#x^0 == 1 so NA ^ 0 == 1 and 1 is not missing
NA^0
#NA or True == True and True is not missing
NA | TRUE
#NA and False == False and False is not missing
NA & FALSE