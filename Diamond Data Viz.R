# Data Visualization using Diamond Data set:
# Load required libraries
library(ggplot2)  # For data visualization
library(dplyr)    # For data manipulation

# Load the diamond dataset
data("diamonds")

# Plotting a scatterplot of carat vs. price
ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point() +
  labs(x = "Carat", y = "Price") +
  ggtitle("Scatterplot of Carat vs. Price")


# Plotting a scatterplot of carat vs. price, colored by cut
ggplot(diamonds, aes(x = carat, y = price, color = cut)) +
  geom_point() +
  labs(x = "Carat", y = "Price") +
  ggtitle("Scatterplot of Carat vs. Price")



# Plotting the Highest 10% of Data:
# Sort the dataset by price in descending order
diamonds_sorted <- diamonds %>% arrange(desc(price))

# Calculate the number of rows representing the top 10%
top_10_percent <- nrow(diamonds_sorted) * 0.1

# Select the top 10% of data
diamonds_top_10 <- diamonds_sorted %>% slice_head(n = top_10_percent)

# Plotting a scatterplot of carat vs. price for the top 10%
ggplot(diamonds_top_10, aes(x = carat, y = price, color = cut)) +
  geom_point() +
  labs(x = "Carat", y = "Price") +
  ggtitle("Scatterplot of Carat vs. Price (Top 10%)")


# Plotting the First 10 Data Points:

# Select the first 10 data points
diamonds_first_10 <- diamonds %>% slice_head(n = 10)

# Plotting a scatter plot of carat vs. price for the first 10 data points
ggplot(diamonds_first_10, aes(x = carat, y = price)) +
  geom_point() +
  labs(x = "Carat", y = "Price") +
  ggtitle("Scatterplot of Carat vs. Price (First 10 Data Points)")


# Plotting a scatter plot of carat vs. price, colored by cut
ggplot(diamonds, aes(x = carat, y = price, color = cut)) +
  geom_point() +
  labs(x = "Carat", y = "Price") +
  ggtitle("Scatterplot of Carat vs. Price") +
  ylim(0, 20000)  # Set the range of numbers on the y-axis


# Plotting a scatterplot of carat vs. price, colored by cut
ggplot(diamonds, aes(x = carat, y = price, color = cut)) +
  geom_point() +
  labs(x = "Carat", y = "Price") +
  ggtitle("Scatterplot of Carat vs. Price") 
#+
  scale_y_continuous(breaks = c(0, 200, 300, 400, 500), labels = c("0", "200", "300", "400", "500"))

# Line chart of diamond price by carat
ggplot(diamonds, aes(x = carat, y = price)) + 
  geom_line() +
  labs(x = "Carat", y = "Price") +
  ggtitle("Line Chart of Diamond Price by Carat")

ggplot(diamonds, aes(x = price)) + 
  geom_freqpoly(bins = 15)

ggplot(diamonds, aes(x = carat)) + 
  geom_freqpoly(bins = 15) 


ggplot(diamonds, aes(x = carat)) + 
  geom_freqpoly(bins = 15) +
  ggtitle("Histogram of Diamond Carat") +
  theme(
    plot.title = element_text(hjust = 0.5)  # Center the title
  )

  


# Histogram of diamond carat distribution
ggplot(diamonds, aes(x = carat)) +
  geom_histogram(binwidth = 0.5, fill = "blue", color = "black") +
  labs(x = "Carat", y = "Frequency") +
  ggtitle("Histogram of Diamond Carat Distribution")

# Create a histogram of diamond carat distribution adjusting the binwidth and adding xlim
ggplot(diamonds, aes(x = carat)) +
  geom_histogram(binwidth = 0.1, fill = "blue", color = "black") +
  labs(x = "Carat", y = "Frequency") +
  ggtitle("Histogram of Diamond Carat Distribution") +
  xlim(0.2, 1.0)


# Bar chart and Column chart
# geom_bar() - used when the data you're plotting represents counts or frequencies. It 
# automatically calculates the count of observations in each category and displays it as bars.

# Bar chart of diamond cut frequencies
ggplot(diamonds, aes(x = cut)) +
  geom_bar() +
  labs(x = "Cut", y = "Frequency") +
  ggtitle("Bar Chart of Diamond Cut Frequencies")


# Bar chart of diamond color frequencies
ggplot(diamonds, aes(x = color)) +
  geom_bar() +
  labs(x = "Color", y = "Frequency") +
  ggtitle("Bar Chart of Diamond Color Frequencies")

ggplot(diamonds, aes(x = fct_infreq(cut))) + 
  geom_bar (color = "black", # color function works for the borders of the chart
            fill = "lightblue")



# To sort the bars 
library(forcats)

ggplot(diamonds) +
  geom_bar(aes(x = fct_infreq(color))) +
  labs(x = "Color", y = "Frequency") +
  ggtitle("Bar Chart of Diamond Color Frequencies")

# in ascending order

ggplot(diamonds) +
  geom_bar(aes(x = fct_rev(fct_infreq(color)))) +
  labs(x = "Color", y = "Frequency") +
  ggtitle("Bar Chart of Diamond Color Frequencies (Ascending)")



# Bar chart of diamond cut frequencies colored by color
ggplot(diamonds, aes(x = color, fill = cut)) +
  geom_bar(position = "dodge") +
  labs(x = "Cut", y = "Frequency", fill = "Color") +
  ggtitle("Bar Chart of Diamond Cut Frequencies by Color")


ggplot(diamonds, aes(x = cut, 
                     fill = cut)) + 
  geom_bar(show.legend = FALSE) + # to remove the legend from the chart 
  scale_fill_brewer(palette = "Dark2") # to make the fill darker

 
#Bar chart of diamond cut and color frequencies
ggplot(diamonds, aes(x = cut)) +
  geom_bar() +
  labs(x = "Cut", y = "Frequency") +
  ggtitle("Bar Chart of Diamond Cut Frequencies") +
  facet_wrap(~ color)


# Adding data labels on chart and removing y_axis number
# Bar chart of diamond color frequencies
ggplot(diamonds, aes(x = color)) +
  geom_bar() +
  labs(x = "Color", y = "Frequency") +
  ggtitle("Bar Chart of Diamond Color Frequencies") +
  geom_text(
    aes(label = after_stat(count)), 
    stat = "count",
    position = position_stack(vjust = 1.1),
    size = 3, 
    color = "black"
  ) +
  scale_y_continuous(
    breaks = NULL,  # Remove y-axis breaks
    labels = NULL   # Remove y-axis labels
  ) 



ggplot(diamonds) +
  geom_bar(aes(x = fct_rev(fct_infreq(color)))) +  # Use 'fill' for bar colors
  labs(x = "Color", y = "Frequency") +
  ggtitle("Bar Chart of Diamond Color Frequencies (Ascending)") +
  scale_fill_brewer(palette = "Dark2") +  # Apply color palette to bars
  theme_minimal()  # Set the background to minimal style



ggplot(diamonds) +
  geom_bar(aes(x = fct_rev(fct_infreq(color)), fill = color)) +  
  labs(x = "Color", y = "Frequency") +
  ggtitle("Bar Chart of Diamond Color Frequencies") +
  scale_fill_brewer(palette = "Dark2") +  
  theme(
    panel.background = element_rect(fill = "black") ,  # Panel (plotting area) background
    plot.background = element_rect(fill = "black"),   # Entire plot background
    text = element_text(color = "white"),             # Text color
    axis.text = element_text(color = "white"),        # Axis text color
    axis.title = element_text(color = "white"),       # Axis title color
    plot.title = element_text(color = "white", hjust = 0.5)  # Center the title
  )













# geom_col() - you want to plot values directly from your dataset without precalculating counts.
# It's often used when you already have the summarized data that you want to plot.

# Calculate the frequency of each diamond color
color_freq <- table(diamonds$color)

# Convert the frequency table to a data frame
color_df <- as.data.frame(color_freq)
names(color_df) <- c("Color", "Frequency")

# Plot a column chart
ggplot(color_df, aes(x = Color, y = Frequency)) +
  geom_col(fill = "blue", color = "black") +
  labs(x = "Color", y = "Frequency") +
  ggtitle("Column Chart of Diamond Color Frequencies")
