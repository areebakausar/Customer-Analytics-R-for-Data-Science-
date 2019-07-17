library(tidyverse)
library(nycflights13)

#5.6.7 Exercises

not_cancelled <- flights %>% 
  filter(!is.na(dep_delay), !is.na(arr_delay))

#5.6.7.1 Brainstorm at least 5 different ways to assess the typical delay characteristics of a group of flights. Consider the following scenarios:

#A flight is 15 minutes early 50% of the time, and 15 minutes late 50% of the time| flight is 30 minutes early 50% of the time, and 30 minutes late 50% of the time.
not_cancelled %>% 
  group_by(year, month, day) %>% 
  summarise(
    early = mean(arr_delay < -15), #average delay per flight group and average delay per flight group under 15
    late = mean(dep_delay > 15) 
    ) %>%
  filter(early > 0.5 & late > 0.5) #taking out average delay per flight group with occurance over 50 percent

#A flight is always 10 minutes late.
not_cancelled %>% 
  group_by(year, month, day) %>% 
  summarise(
    late_dep = mean(dep_delay >= 10),
    late_arr = mean(arr_delay >= 10)
  )

#9% of the time a flight is on time. 1% of the time it’s 2 hours late.
not_cancelled %>% 
  group_by(year, month, day) %>% 
  summarise(
    on_time = mean(arr_delay == 0),
    running_late = mean(arr_delay > 120) 
  ) %>%
  filter(on_time > 0.09 & running_late > 0.01) 

#Which is more important: arrival delay or departure delay?
#Arrival Delay is more important since flight can make up for departure delay in air


#5.6.7.2 Come up with another approach that will give you the same output as not_cancelled %>% count(dest) and not_cancelled %>% count(tailnum, wt = distance) (without using count()).
not_cancelled %>% count(dest) #all you want is a count:
not_cancelled %>%
  group_by(dest) %>%
  summarise(n = n())

not_cancelled %>% count(tailnum, wt = distance) # “count” (sum) the total number of miles a plane flew:
not_cancelled %>% 
  group_by(tailnum) %>% 
  summarise(flew = sum(distance))


#5.6.7.3 Our definition of cancelled flights (is.na(dep_delay) | is.na(arr_delay) ) is slightly suboptimal. Why? Which is the most important column?
#arr_delay is most important column

#5.6.7.4 Look at the number of cancelled flights per day. Is there a pattern? Is the proportion of cancelled flights related to the average delay?
view( 
flights %>%
  mutate(cancelled = !(is.na(arr_delay) & is.na(dep_delay))) %>%
  group_by(year, month, day) %>%
  summarise(
    total_flights = n(),
    cancelled_flights = sum(cancelled),
    flight_dep_delay = mean(dep_delay, na.rm = TRUE),
    flight_arr_delay = mean(arr_delay, na.rm = TRUE)
  ))

#5.6.7.5 Which carrier has the worst delays? Challenge: can you disentangle the effects of bad airports vs. bad carriers? Why/why not? (Hint: think about flights %>% group_by(carrier, dest) %>% summarise(n()))

view(not_cancelled)

