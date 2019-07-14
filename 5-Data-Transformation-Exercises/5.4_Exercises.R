library(tidyverse)
library(nycflights13)

#5.4.1 Exercises

#5.4.1.1 Brainstorm as many ways as possible to select dep_time, dep_delay, arr_time, and arr_delay from flights
select(flights, dep_time, dep_delay, arr_time, arr_delay)
select(flights, starts_with("dep_time"), starts_with("dep_delay"), starts_with("arr_time"), starts_with("arr_delay"))

#5.4.1.2 What happens if you include the name of a variable multiple times in a select() call?
#The function only selects the variable once
select(flights, dep_time, dep_time, dep_time, dep_time)

#5.4.1.3 What does the one_of() function do? Why might it be helpful in conjunction with this vector?
#one_of() checks whether the full variabale name matches with one OR MORE of the names in dataset & helps us answer the previous question more efficiently 
vars <- c("dep_time", "dep_delay", "arr_time", "arr_delay")
select(flights, one_of(vars))

#5.4.1.4 Does the result of running the following code surprise you? How do the select helpers deal with case by default? How can you change that default?
#Default behaviour prints every variable contaning the word Time - This could be changed by using additional select functions
#Default bheaviour sets ignore.case to TRUE which could be overridden 
select(flights, contains("TIME"))
select(flights, contains("TIME", ignore.case = FALSE))


