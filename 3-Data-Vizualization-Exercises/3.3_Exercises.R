#install.packages("tidyverse")
library(tidyverse)

#3.3.1.1 What’s gone wrong with this code? Why are the points not blue?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

#3.3.1.2 Which variables in mpg are categorical? Which variables are continuous? 
?mpg
mpg
glimpse(mpg)
#categorical: manufacturer model trans drv fl class  
#continuous: displ  year   cyl  cty   hwy

#3.3.1.3 Map a continuous variable to color, size, and shape. How do these aesthetics behave differently for categorical vs. continuous variables?
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, colour = class))


#3.3.1.4 What happens if you map the same variable to multiple aesthetics?
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, colour = displ, size = hwy))

#3.3.1.5 What does the stroke aesthetic do? What shapes does it work with? 
?geom_point
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), size = 1, color = "pink", stroke = 1)

#3.3.1.6 What happens if you map an aesthetic to something other than a variable name, like aes(colour = displ < 5)? Note, you’ll also need to specify x and y.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, colour = hwy < 30))


