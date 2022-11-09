library(tidyverse)      # for plotting and wrangling data
library(gardenR)        # for Lisa's garden data
library(rmarkdown)      # for rendering
# Set main folder
here::i_am("README.md")

# example of one render

render(input = here("02_parameterized_report.Rmd"),
       output_file = here("sample_render", "squash_example.html"),
       params = list(vegetable = "squash"))



# all vegetables that were harvested more than twice.

# name this the same name as your parameter - you'll see why when we open reports

vegetable <- harvest_2021 %>% 
  group_by(vegetable) %>% 
  summarize(n = n()) %>% 
  filter(n > 2) %>% 
  pull(vegetable)

reports <- tibble(
  input = here("02_parameterized_report.Rmd"),
  output_file = here("output", paste0(vegetable, "-report.html")),
  params = map(vegetable, ~list(vegetable = .))
)

reports %>% 
  pwalk(render)










