#install.packages("tidyverse")
library(tidyverse)

#3.9.1.1 Turn a stacked bar chart into a pie chart using coord_polar()
ggplot(mpg, aes(x = factor(1), fill = drv)) +
  geom_bar()

ggplot(mpg, aes(x = factor(1), fill = drv)) +
  geom_bar(width = 1) +
  coord_polar(theta = "y")

#3.9.1.2 What does labs() do?
?labs()

#3.9.1.3 What’s the difference between coord_quickmap() and coord_map()?
?coord_quickmap()
?coord_map()

#3.9.1.4 What does the plot below tell you about the relationship between city and highway mpg? Why is coord_fixed() important? What does geom_abline() do?
  
  ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point() + 
  geom_abline() +
  coord_fixed()