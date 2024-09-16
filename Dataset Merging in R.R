
# Data set merging involves combining two or more data frames into a single data frame 
# based on a common key or condition. 
# Load the required packages
library(datasets)
library(dplyr)

# Use sample data sets from the data sets package
data("mtcars")
data("iris")

# Merge two datasets based on the 'cyl' column from mtcars and the 'Species' column from iris
merged_data <- merge(mtcars, iris, by.x = "cyl", by.y = "Sepal.Length")

# Display the first few rows of the merged data
head(merged_data)

# left_join() Function from dplyr

joined_data <- left_join(mtcars, iris, by = c("cyl" = "Sepal.Length"))


# Print the first few rows of the joined data
head(joined_data)

# Grouping Data
# Group mtcars by the 'cyl' (number of cylinders) variable
grouped_data <- mtcars %>%
  group_by(cyl) %>%
  summarize(avg_hp = mean(hp), avg_mpg = mean(mpg))

# Display the grouped data
print(grouped_data)

unique(mpg$model)

# Load required package
library(datasets)

# Access the mtcars and iris datasets
data("mtcars")
data("iris")

# Create a list containing data frames and vectors from mtcars and iris datasets
my_list <- list(
  mtcars_data = mtcars,  # Add mtcars dataset as a data frame
  iris_data = iris, 
  mpg = mpg)

# Print the list
print(my_list)

# ------------------------------------------------------------------------------------------------
print(BrewerySales)
library(dplyr)
library(data.table)
install.packages("sqldf")
library(sqldf)

# Using merge function from base R

# Inner join on SALES_ID
merge(IncompleteBrewerySales, BreweryProducts, by = "SALES_ID")

# Left join on SALES_ID
m <- merge(IncompleteBrewerySales, BreweryProducts, by = "SALES_ID", all.x = TRUE)

# Right join on SALES_ID
merge(IncompleteBrewerySales, BreweryProducts, by = "SALES_ID", all.y = TRUE)

# Full join on SALES_ID
merge(BrewerySales, BreweryProducts, by = "SALES_ID", all.x = TRUE, all.y = TRUE)


# Using join functions from the dplyr package

# Inner join on SALES_ID
merged_inner <- inner_join(BrewerySales, BreweryProducts, by = "SALES_ID")

# Left join on SALES_ID
merged_left <- left_join(BrewerySales, BreweryProducts, by = "SALES_ID")

# Right join on SALES_ID
merged_right <- right_join(BrewerySales, BreweryProducts, by = "SALES_ID")

# Full join on SALES_ID
merged_full <- full_join(BrewerySales, BreweryProducts, by = "SALES_ID")

# Using data.table package -  efficient and fast, particularly for large data sets

library(data.table)

# Convert data frames to data.tables
dt_BrewerySales <- data.table(BrewerySales)
dt_BreweryProducts <- data.table(BreweryProducts)
dt_IncompleteBrewerySales <- data.table(IncompleteBrewerySales)

dt_IncompleteBrewerySales[dt_BreweryProducts, on = "SALES_ID"] 
dt_BreweryProducts[dt_IncompleteBrewerySales, on = "SALES_ID"]

dt_IncompleteBrewerySales[dt_BreweryProducts, on = "SALES_ID", nomatch = 0]
dt_BreweryProducts[dt_IncompleteBrewerySales, on = "SALES_ID", nomatch = 0]
merge(dt_IncompleteBrewerySales, dt_BreweryProducts, by = "SALES_ID", all = TRUE)


# to delete a table and to check if a table still exists
rm(datasetname)
exists(datasetname)

library(sqldf)

# Inner join BrewerySales and BreweryProducts on SALES_ID
sqldf1 <- sqldf("SELECT * FROM BrewerySales INNER JOIN BreweryProducts ON 
                 BrewerySales.SALES_ID = BreweryProducts.SALES_ID")



final_joined <- sqldf("SELECT * FROM joined1 INNER JOIN BrewerySuppliers ON 
                      joined1.SUPPLIER_ID = BrewerySuppliers.SUPPLIER_ID")


library(dplyr)
combined_columns <- bind_cols(BrewerySales, BreweryProducts) # for tables with different column names

combined_rows <- bind_rows(BrewerySales, IncompleteBrewerySales) # for tables with same column names


#Append 
combined_df <- rbind(df1, df2) #using base R

combined_df <- bind_rows(df1, df2) #using dplyr






# Summary Statistics:
summary(BrewerySales)
summary(BreweryProducts)

Brewery_merged <- inner_join(BrewerySales, BreweryProducts, by = "SALES_ID")


Brewery_merged %>%
  group_by(SALES_REP) %>%
  summarize(total_sales = sum(COST), total_profit = sum(PROFIT), Quantity = sum(QUANTITY)) %>% 
  arrange(desc(Quantity))

Brewery_merged %>%
  group_by(YEARS) %>%
  summarize(total_sales = sum(COST), total_profit = sum(PROFIT), Quantity = sum(QUANTITY)) %>% 
  arrange(desc(Quantity))

BrandSalesSummary <- Brewery_merged %>%
  group_by(BRANDS) %>%
  summarize(total_sales = sum(COST), total_profit = sum(PROFIT), Expenses = sum(COST - PROFIT), 
            Quantity = sum(QUANTITY), PlantCost = mean(PLANT_COST), 
            UnitPrice = mean(UNIT_PRICE),  Margin = total_profit/total_sales) %>%
  arrange(desc(total_profit))

# Create a horizontal bar chart
ggplot(BrandSalesSummary, aes(x = PlantCost , y = BRANDS)) +
    geom_col() +  # Use geom_col() for bar chart with identity stat
     coord_flip() +  # Flip the axes for horizontal bars
     labs(title = "Quantity by Brand",
                  x = "Quantity",
                  y = "Brand") 

library(forcats)

ggplot(Brewery_merged, aes(x = YEARS)) +
  geom_bar() +  # Use geom_col() for bar chart with identity stat
  coord_flip() +  # Flip the axes for horizontal bars
  labs(title = "Years Frequency",
       x = "Years",
       y = "Frequency") 

ggplot(Brewery_merged, aes(x = REGION)) +
  geom_bar() +  # Use geom_col() for bar chart with identity stat
  coord_flip() +  # Flip the axes for horizontal bars
  labs(title = "Years Frequency",
       x = "Years",
       y = "Frequency") 

library(purrr)
# Calculate mean of each numeric column
map_dbl(BreweryProducts, ~ mean(.x, na.rm = TRUE))
head(means)

# Calculate length of each column
map(BreweryProducts, length)
















  
