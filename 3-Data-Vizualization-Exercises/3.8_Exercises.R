#install.packages("tidyverse")
library(tidyverse)

#3.8.1.1 What is the problem with this plot? How could you improve it?
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_point(position = "jitter")

#3.8.1.2 What parameters to geom_jitter() control the amount of jittering?
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point(position = position_jitter())

#3.8.1.3 Compare and contrast geom_jitter() with geom_count()
?geom_jitter()
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_jitter()
?geom_count()
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_count()

#3.8.1.4 What’s the default position adjustment for geom_boxplot()? Create a visualisation of the mpg dataset that demonstrates it.
ggplot(data = mpg, aes(x = drv, y = hwy, colour = model)) +
  geom_boxplot()
