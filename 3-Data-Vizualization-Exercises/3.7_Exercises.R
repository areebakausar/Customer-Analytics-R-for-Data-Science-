#install.packages("tidyverse")
library(tidyverse)

#3.7.1.1 What is the default geom associated with stat_summary()? How could you rewrite the previous plot to use that geom function instead of the stat function?
?stat_summary() # default geom = "pointrange"
ggplot(data = diamonds) +
  geom_pointrange(
    mapping = aes(x = cut, y = depth),
    stat = "summary",
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )

#3.7.1.2 What does geom_col() do? How is it different to geom_bar()?
?geom_col() #geom_col() understands the following aesthetics:
# x y alpha colour fill group linetype size
?geom_bar() # geom_bar() understands the following aesthetics
# x y alpha colour fill group linetype size

#3.7.1.3 Most geoms and stats come in pairs that are almost always used in concert. Read through the documentation and make a list of all the pairs. What do they have in common?

#3.7.1.4 What variables does stat_smooth() compute? What parameters control its behaviour?
#y, ymin, ymax, se | method, formula, na.rm

#3.7.1.5 In our proportion bar chart, we need to set group = 1. Why? In other words what is the problem with these two graphs?

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = ..prop..))
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = color, y = ..prop..))

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = ..prop.., group = 1))
ggplot(data = diamonds) +
  geom_bar(aes(x = cut, y = ..count.. / sum(..count..), fill = color))

