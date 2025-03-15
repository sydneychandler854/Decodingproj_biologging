library(tidyverse)
biolog_data <- read.csv("data_decoding.csv")

# Graph 2: Biologging availability vs device category

nice_colors <- c("#00B496", "pink", "coral")

biolog_data$biologging_availability <- factor(biolog_data$biologging_availability,
                                              # levels are the order
                                              levels = c("Y", "N"),
                                              # labels are the text labels
                                              labels = c("Yes", "No"))
# biolog_data$device_cat <- factor(biolog_data$device_cat,
#                         levels = c("Y", "N"),
#                         labels = c("Yes", "No"))
# %>% this is called the pipe
# Read it as the word "then"
# Use it to build pipelines
biolog_by_habitat <- biolog_data %>%
  separate_longer_delim(habitat,
                        delim = ", ") %>%
  filter(habitat != "")

#####

biolog_by_habitat$habitat <- factor(biolog_data$habitat,
                               levels = c("A", "M", "T"),
                               labels = c("Aquatic", "Marine", "Terrestrial"))

#####

ggplot(biolog_by_habitat,
       aes(biologging_availability,
           fill = habitat)) +
  geom_bar() +
  labs(x = "Biologging Availability", y = "Number of Articles", fill = "Habitat") +
  theme_bw() +
  scale_fill_manual(values = nice_colors)









