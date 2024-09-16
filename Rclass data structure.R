# creating vector
id <- c(1:5)

name <- c("Ud", "Tim", "Buba", "Cha", "Hali")

Age <-c(23,43,55, 20, 65)

# list
a <- list(1, 6, "ton", "ko", 66)

# matrix 
o <- matrix(1:6, ncol = 2, nrow = 3 )

# data frame

d <- data.frame(id, name, Age)

Stu <- data.frame(id, name, Age)
listt <- matrix(1:9, nrow = 3, ncol = 3)


View(d)
library(tidyverse)

library(datasets)

data()

view(mpg)

??mpg
??iris

head()
tail()
sample(mpg)
str(mpg)
glimpse(mpg)
summary(mpg)

m <- mpg

unique(m$manufacturer)
table(m$manufacturer)


