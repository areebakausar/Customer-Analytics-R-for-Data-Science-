#install.packages("tidyverse")
library(tidyverse)

#3.6.1.1 What geom would you use to draw a line chart? 
geom_line()
#A boxplot? 
geom_boxplot()
#A histogram?
geom_histogram()
#An area chart?
geom_area()

#3.6.1.2 Run this code in your head and predict what the output will look like. Then, run the code in R and check your predictions.
# scatterplot, displ and hwy on axis, three colors for drv and three smooth lines for each
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth(se = FALSE)

#3.6.1.3 What does show.legend = FALSE do? What happens if you remove it?
#removes legend
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point(show.legend = FALSE) + 
  geom_smooth(se = FALSE, show.legend = FALSE)

#3.6.1.4 What does the se argument to geom_smooth() do?
#adds error bands around lines

#3.6.1.5 Will these two graphs look different? Why/why not?
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()

ggplot() + 
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))

#Same, however changing a variable once will make them differ

#3.6.1.6 Recreate the R code necessary to generate the following graphs
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth(se=FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth(mapping = aes(group = drv), se=FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth(se=FALSE)

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(colour = drv)) +
  geom_smooth(se = FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = drv)) + 
  geom_smooth(mapping = aes(linetype = drv), se=FALSE)

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(size = 4, color = "white") +
  geom_point(aes(colour = drv))