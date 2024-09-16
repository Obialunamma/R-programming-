#Inner join on SALES_ID
b <- inner_join(BrewerySales, BreweryProducts, by = "SALES_ID")

install.packages("sqldf")
library(sqldf)
library(tidyverse)
s <- sqldf("SELECT * FROM BrewerySales INNER JOIN BreweryProducts ON 
                 BrewerySales.SALES_ID = BreweryProducts.SALES_ID")

sqldf("select * from b")

# to export the data b to a csv file
write.csv(b, file = "br.csv", row.names = FALSE)

# Export the cleaned data to a CSV file
write.csv(data_clean, file = "cleaned_data.csv", row.names = FALSE)

# Export data as a text file (CSV or tsv)
write.table(b, file = "br.txt", sep = ",", row.names = FALSE) #csv

write.table(employee, file = "employee.txt", sep = "\t" , row.names = FALSE)



r <- bind_cols(BrewerySales, BreweryProducts)

#Append 
combined_df <- rbind(df1, df2) #using base R

combined_df <- bind_rows(df1, df2) #using dplyr

s <- summary(b)
table(b$BRANDS)


#Analysis using sqldf

# Total sales and profit by sales rep
 sqldf("SELECT SALES_REP, 
         SUM(COST) AS Total_Sales, 
         SUM(PROFIT) AS Total_Profit
  FROM b
  GROUP BY SALES_REP
  ORDER BY Total_profit  DESC
")

 
 # Average profit by region and year
 sqldf("SELECT REGION, YEARS, 
         AVG(PROFIT) AS Avg_Profit
  FROM b
  GROUP BY REGION, YEARS
  ORDER BY REGION  
")

 # Top 5 most profitable brands
 sqldf("
  SELECT BRANDS, 
         SUM(PROFIT) AS Total_Profit
  FROM b
  GROUP BY BRANDS
  ORDER BY Total_Profit DESC
  LIMIT 5
")

 
 # Plotting SALES_REP vs REVENUE
 ggplot(b, aes(x = SALES_REP, y = COST)) +
   geom_col(fill = "skyblue") +
   labs(title = "Sales Rep vs Revenue", x = "Sales Representative", y = "Revenue") +
   theme_minimal()


 
 # Plotting SALES_REP vs REVENUE
   ggplot(b, aes(x = fct_infreq(SALES_REP), y = COST)) +
   geom_col(fill = "black") +
   labs(title = "Sales Rep vs Revenue", x = "Sales Representative", y = "Revenue") +
   theme_minimal()

 

  ggplot(b, aes(x = BRANDS, y = UNIT_PRICE)) +
    geom_col(fill = "lightgreen") +
    labs(title = "Brand vs Average Unit Price", x = "Brand", y = "Average Unit Price") +
    theme_minimal()

  filter(b, b$PROFIT > (mean(PROFIT)))
  