library(tidyverse)
biolog_data <- read.csv("data_decoding.csv")

# Graph 2: Biologging availability vs device category

nice_colors <- c("#00B496", "pink", "coral")

biolog_data$biologging_availability <- factor(biolog_data$biologging_availability,
                                       levels = c("Y", "N"),
                                       labels = c("Yes", "No"))
# biolog_data$device_cat <- factor(biolog_data$device_cat,
#                         levels = c("Y", "N"),
#                         labels = c("Yes", "No"))
# %>% this is called the pipe
# Read it as the word "then"
# Use it to build pipelines
biolog_by_device <- biolog_data %>%
  separate_longer_delim(device_cat,
                        delim = ", ") %>%
  filter(device_cat != "")

#

biolog_by_device$device_cat <- factor(biolog_by_device$device_cat,
                                    levels = c("E", "I", "L"),
                                    labels = c("Environment", "Intrinsic", "Location"))

#

ggplot(biolog_by_device,
       aes(biologging_availability,
           fill = device_cat)) +
  geom_bar() +
  labs(x = "Biologging Availability", y = "Number of Articles", fill = "Device Category") +
  theme_bw() +
  scale_fill_manual(values = nice_colors)






















