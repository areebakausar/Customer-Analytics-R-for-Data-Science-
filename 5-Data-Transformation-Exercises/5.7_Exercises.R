library(tidyverse)
library(nycflights13)

#5.7.1 Exercises

not_cancelled <- flights %>% 
  filter(!is.na(dep_delay), !is.na(arr_delay))

#5.7.1.1 Refer back to the lists of useful mutate and filtering functions. Describe how each operation changes when you combine it with grouping.
#These functions return values specific to their group when applied alongside group_By

#5.7.1.2 Which plane (tailnum) has the worst on-time record?

#5.7.1.3 What time of day should you fly if you want to avoid delays as much as possible?

#5.7.1.4 For each destination, compute the total minutes of delay. For each flight, compute the proportion of the total delay for its destination.

#5.7.1.5 Delays are typically temporally correlated: even once the problem that caused the initial delay has been resolved, later flights are delayed to allow earlier flights to leave. Using lag(), explore how the delay of a flight is related to the delay of the immediately preceding flight.

#5.7.1.6 Look at each destination. Can you find flights that are suspiciously fast? (i.e. flights that represent a potential data entry error). Compute the air time a flight relative to the shortest flight to that destination. Which flights were most delayed in the air?
  
#5.7.1.7  Find all destinations that are flown by at least two carriers. Use that information to rank the carriers.

#5.7.1.8 For each plane, count the number of flights before the first delay of greater than 1 hour.