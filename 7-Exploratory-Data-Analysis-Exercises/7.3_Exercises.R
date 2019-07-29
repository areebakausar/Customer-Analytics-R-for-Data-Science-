library(tidyverse)

#7.3.4.1 Explore the distribution of each of the x, y, and z variables in diamonds
ggplot(data = diamonds, mapping = aes(x = x)) +
  geom_histogram(binwidth = 0.5)

ggplot(data = diamonds, mapping = aes(x = y)) +
  geom_histogram(binwidth = 0.5)

ggplot(data = diamonds, mapping = aes(x = z)) +
  geom_histogram(binwidth = 0.5)

#7.3.4.2 Explore the distribution of price:

ggplot(data = diamonds, mapping = aes(x = price)) +
  geom_histogram(binwidth = 10)

#7.3.4.3 How many diamonds are 0.99 carat? How many are 1 carat? What do you think is the cause of the difference?
filtered_diamonds <-  filter(diamonds, carat >= 0.98, carat <= 1.01)

count(filtered_diamonds, carat)

ggplot(data = filtered_diamonds , mapping = aes(x = carat)) +
  geom_freqpoly(binwidth = 0.01)

#7.3.4.4 Compare and contrast coord_cartesian() vs xlim() or ylim() when zooming in on a histogram. 

ggplot(diamonds) +
  geom_histogram(mapping = aes(x = price)) +
  coord_cartesian(xlim = c(100, 5000), ylim = c(0, 3000))

