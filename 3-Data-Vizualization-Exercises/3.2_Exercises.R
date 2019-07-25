install.packages("tidyverse")
library(tidyverse)

#3.2.4.1 Run ggplot(data = mpg). What do you see?
ggplot(data = mpg)
#empty plot

#3.2.4.2 How many rows are in mpg? How many columns?
nrow(mpg)
ncol(mpg)

#3.2.4.3 What does the drv variable describe? Read the help for ?mpg to find out.
?mpg
#f = front-wheel drive, r = rear wheel drive, 4 = 4wd

#3.2.4.4 Make a scatterplot of hwy vs cyl
ggplot(data=mpg) +
  geom_point((mapping = aes(x = hwy, y = cyl)))

#3.2.4.5 What happens if you make a scatter plot of class vs drv? Why is the plot not useful?
ggplot(data=mpg) +
  geom_point((mapping = aes(x = class, y = drv)))
#categorical data
