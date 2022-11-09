library(tidyverse)
library(gardenR)

data(harvest_2021)


# code for tomato_harvest_2021 image

harvest_2021 %>%
  filter(vegetable == "tomatoes") %>%
  ggplot(aes(y = fct_rev(fct_infreq(variety)))) +
  geom_bar() +
  labs(title = "Number of tomato harvests for each variety",
       x = "",
       y = "")


