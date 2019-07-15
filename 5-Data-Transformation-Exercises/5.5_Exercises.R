library(tidyverse)
library(nycflights13)

#5.5.2 Exercises

#5.5.2.1 Currently dep_time and sched_dep_time are convenient to look at, but hard to compute with because they’re not really continuous numbers. Convert them to a more convenient representation of number of minutes since midnight.
transmute(flights, dep_minutes = dep_time %/% 100 * 60 + dep_time %% 100, sched_minutes = sched_dep_time %/% 100 * 60 + sched_dep_time %% 100)

#5.5.2.2 Compare air_time with arr_time - dep_time. What do you expect to see? What do you see? What do you need to do to fix it?
# The arr and dep times belong to separate time zones and must be converted to a singular timezone before the difference could meet air_time
transmute(flights, air_time, 
          arr_time_minutes = arr_time %/% 100 * 60 + arr_time %% 100,
          dep_time_minutes = dep_time %/% 100 * 60 + dep_time %% 100,
          air_time_minutes = arr_time_minutes - dep_time_minutes
          )

#5.5.2.3 Compare dep_time, sched_dep_time, and dep_delay. How would you expect those three numbers to be related?
#sched_dep_time  - dep_time = dep_delay
transmute(flights,  
          dep_time_minutes = dep_time %/% 100 * 60 + dep_time %% 100,
          sched_dep_time_minutes = sched_dep_time %/% 100 * 60 + sched_dep_time %% 100,
          dep_delay_minutes = dep_time_minutes - sched_dep_time_minutes,
          dep_delay
)

#5.5.2.4 Find the 10 most delayed flights using a ranking function. How do you want to handle ties? Carefully read the documentation for min_rank().
#we will use Min_rank() so ties are assigned the same rank value and NA values are taken out
ranked_flights <- mutate(flights, dep_delay_rank = min_rank(desc(dep_delay)))
filtered_ranked_flights <- filter(ranked_flights, dep_delay_rank <= 10)
arrange(filtered_ranked_flights, dep_delay_rank)

#5.5.2.5 What does 1:3 + 1:10 return? Why?
#One shorter vector is added to longer vector under ecycling rules
1:3 + 1:10
u <- c(1, 2, 3)
v <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
u + v

#5.5.2.6 What trigonometric functions does R provide?
?Trig