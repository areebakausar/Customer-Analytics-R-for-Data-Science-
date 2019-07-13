library(tidyverse)
library(nycflights13)

#5.3.1 Exercises

#5.3.1.1 How could you use arrange() to sort all missing values to the start? (Hint: use is.na()).
arrange(flights, desc(is.na(dep_time)))

#5.3.1.2 Sort flights to find the most delayed flights. Find the flights that left earliest.
arrange(flights, desc(dep_delay))
arrange(flights, dep_delay)

#5.3.1.3 Sort flights to find the fastest flights.
arrange(flights, air_time)

#5.3.1.4 Which flights traveled the longest? Which traveled the shortest?
arrange(flights, desc(distance))
arrange(flights, distance)
