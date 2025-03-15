read.csv("data_decoding.csv")
biolog_data <- read.csv("data_decoding.csv")
library(ggplot2)

# Graph 1: Biologging availability vs conservation
conserv_column <- data[ , 13]

availability_column <- data[ , 12]
View(availability_column)

# we want the sum of Y and sum of N for availability
sum(conserv_column == "Y")
# 71
sum(conserv_column == "N")
#80

count_yes_avail <- sum(availability_column == "Y")
# 65
count_no_avail <- sum(availability_column == "N")
#86

ggplot(biolog_data, aes( , y = count_yes_avail)) +
  geom_bar()


# need x to be avail yes/no


data_avail <- c("Yes", "No")
count_avail <- c(count_yes_avail, count_no_avail)

# Taking a new approach

ggplot(biolog_data, aes(biologging_availability)) +
  geom_bar()

# Example

foo <- data.frame(
  pet = c("dog", "dog", "cat")
)
foo$pet <- factor(foo$pet,
                  # levels are the order
                  levels = c("dog", "cat"),
                  # labels are the text labels
                  labels = c("Dog", "Cat"))
ggplot(foo, aes(pet)) +
  geom_bar()

nice_colors <- c("#00B496", "coral")
ggplot(biolog_data, aes(biologging_availability)) +
  geom_bar()
biolog_data$biologging_availability <- factor(biolog_data$biologging_availability,
                                       # levels are the order
                                       levels = c("Y", "N"),
                                       # labels are the text labels
                                       labels = c("Yes", "No"))
biolog_data$conserv. <- factor(biolog_data$conserv.,
                        levels = c("Y", "N"),
                        labels = c("Yes", "No"))
ggplot(biolog_data,
       aes(biologging_availability,
           fill = conserv.)) +
  geom_bar() +
  labs(x = "Biologging Availability", y = "Number of Articles", fill = "Conservation") +
  theme_bw() +
  scale_fill_manual(values = nice_colors)




