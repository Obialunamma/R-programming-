library(tidyverse)
library(modeldata)
?ggplot

install.packages("modeldata")

?crickets
data(crickets)

# Load required libraries
library(modeldata)
library(dplyr)

# Load the cricket dataset
data("crickets")

# View the structure of the dataset
str(crickets)

# Summary statistics
summary(crickets)

# View the first few rows of the dataset
head(crickets)

# Check for missing values
anyNA(crickets)

# Remove rows with missing values
cricket_clean <- na.omit(crickets)

# Convert character columns to factors (if needed)
cricket_clean$species <- as.factor(cricket_clean$species)

table(cricket_clean$species)

# Filter rows based on a condition (example: temperature above 70)
cricket_filtered <- filter(cricket_clean, temp > 70)

# Calculate average rate per species
avg_rate_per_species <- cricket_clean %>%
  group_by(species) %>%
  summarize(avg_rate = mean(rate))

# Reshape data from wide to long format
library(tidyr)
cricket_long <- pivot_longer(cricket_clean, cols = c(rate, temp))

# View the modified dataset
head(cricket_filtered)
head(avg_rate_per_species)
head(cricket_long)





# The basics
# Creating a chart for temp and rate
#geom_point known as scatter plot is good for two quantitative variable
ggplot(crickets, aes(x = temp, 
                     y = rate)) + 
  geom_point() 
  
  
# To label the chart
ggplot(crickets, aes(x = temp, 
                     y = rate)) + 
  geom_point() +
  labs(x = "Temperature",
       y = "Chirp rate",
       title = "Cricket chirps",
       caption = "Source: McDonald (2009)")

# To change the color of the charts based on the different species, you add color = species
ggplot(crickets, aes(x = temp, 
                     y = rate,
                     color = species)) + 
  geom_point() +
  labs(x = "Temperature",
       y = "Chirp rate",
       color = "Species",
       title = "Cricket chirps",
       caption = "Source: McDonald (2009)")

# T o get a darker shade of the color using scale_color_brewer
ggplot(crickets, aes(x = temp, 
                     y = rate,
                     color = species)) + 
  geom_point() +
  labs(x = "Temperature",
       y = "Chirp rate",
       color = "Species",
       title = "Cricket chirps",
       caption = "Source: McDonald (2009)") +
       scale_color_brewer(palette = "Dark2")


# Modifiying basic properties of the plot
ggplot(crickets, aes(x = temp, 
                     y = rate)) + 
  geom_point(color = "blue",
             size = 2,
             shape = "square") +
  labs(x = "Temperature",
       y = "Chirp rate",
       title = "Cricket chirps",
       caption = "Source: McDonald (2009)")

# Learn more about the options for the geom_abline()
# with ?geom_point

# Adding another layer

ggplot(crickets, aes(x = temp, 
                     y = rate)) + 
  geom_point() +
  geom_smooth() +
  labs(x = "Temperature",
       y = "Chirp rate",
       title = "Cricket chirps",
       caption = "Source: McDonald (2009)")

# to modify the geom_smooth
ggplot(crickets, aes(x = temp, 
                     y = rate)) + 
  geom_point() +
  geom_smooth(method = "lm", # to make the line linear
              se = FALSE) + # se = false takes away the shadow from the line
  labs(x = "Temperature",
       y = "Chirp rate",
       title = "Cricket chirps",
       caption = "Source: McDonald (2009)")

ggplot(crickets, aes(x = temp, 
                     y = rate,
                     color = species)) + 
  geom_point() +
  geom_smooth(method = "lm",
              se = FALSE) +
  labs(x = "Temperature",
       y = "Chirp rate",
       color = "Species",
       title = "Cricket chirps",
       caption = "Source: McDonald (2009)") +
  scale_color_brewer(palette = "Dark2") # to make the colors darker

# Other plots

ggplot(crickets, aes(x = rate)) + 
  geom_histogram(bins = 15) # one quantitative variable

ggplot(crickets, aes(x = rate)) + 
  geom_freqpoly(bins = 15)

ggplot(crickets, aes(x = species)) + # one categorical variable
  geom_bar()

ggplot(crickets, aes(x = species)) + 
  geom_bar (color = "black",
fill = "lightblue")


ggplot(crickets, aes(x = species, 
                     fill = species)) + 
  geom_bar(show.legend = FALSE) +
  scale_fill_brewer(palette = "Dark2")

# geom_boxplot is good for one categorical and one quantitative variables
# boxplot is a visual representation of your 5 number summary; minimum - the line below
# 1st quartile, the 2nd quartile which is the medium (the line in-between ), the 3rd quartile and the max - the line above

ggplot(crickets, aes(x = species, 
                     y = rate,
                     color = species)) + 
  geom_boxplot(show.legend = FALSE) +
  scale_color_brewer(palette = "Dark2") +
  theme_minimal()

# theme_minimal,classic,bw,light etc
?theme_minimal()
#to remove the gray background in the chart using theme minimal
ggplot(crickets, aes(x = species, 
                     y = rate,
                     color = species)) + 
  geom_boxplot(show.legend = FALSE) +
  scale_color_brewer(palette = "Dark2") +
  theme_minimal()




# faceting

# not great:
ggplot(crickets, aes(x = rate, 
                     fill = species)) + 
  geom_histogram(bins = 15) +
  scale_fill_brewer(palette = "Dark2")

ggplot(crickets, aes(x = rate,
                     fill = species)) + 
  geom_histogram(bins = 15,
                 show.legend = FALSE) + 
  facet_wrap(~species) +
  scale_fill_brewer(palette = "Dark2")
?facet_wrap

ggplot(crickets, aes(x = rate,
                     fill = species)) + 
  geom_histogram(bins = 15,
                 show.legend = FALSE) + 
  facet_wrap(~species,
             ncol = 1) +
  scale_fill_brewer(palette = "Dark2") + 
  theme_minimal()
