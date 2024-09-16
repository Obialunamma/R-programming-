c<- C
install.packages("sqldf")
library (sqldf)
sqldf("select * from c")
c$
d <- sqldf("select SALES_REP, sum(PROFIT) AS PROFIT,
           sum(QUANTITY) AS QUANTITY,
           count (SALES_REP) AS ORDERS FROM c
           GROUP BY SALES_REP
           ORDER BY PROFIT desc")
c$
 sqldf("select sum(COST), YEARS, MONTHS from c
 GROUP BY MONTHS")


s <- sqldf("SELECT MONTHS, YEARS, 
     sum(PROFIT) AS PROFIT, 
      sum(QUANTITY)AS QUANTITY, 
      sum(COST) AS REVENUE, 
      count(*) AS ORDERS
      FROM c
      GROUP BY MONTHS, YEARS
      ORDER BY PROFIT desc ")
view(s)

 d<- c %>% 
    group_by(MONTHS, YEARS) %>% 
    summarize(profit = sum(PROFIT), 
              revenue = sum(COST),
              quantity = sum(QUANTITY),
              orders = n()) %>% 
   arrange(desc(profit))
 
 # to export data 
 write.csv(p, file = "p.csv", row.names = FALSE)
 write.csv(p, file = "g.csv")
 
 write.table(p, file = "m.csv", sep = ",")
 write.table(p, file = "m.txt", sep = "\t")
  