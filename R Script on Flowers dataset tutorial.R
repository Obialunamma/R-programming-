# To save files in R
save(nameOfObject, file = "name_of_file.RData")
save.image(file = "name_of_file.RData")
load(file = "name_of_file.RData")

#Data types in R
# Numeric (Decimal) is the default data type for numbers in R
X<- 45

X = 5.6

# print the class name of variable
print(class(X))

# print the type of variable
print(typeof(X))

# To Create an integer value i.e a whole number, use as.integer or L suffix
X = as.integer(5)

# print the class name of x
print(class(X))

# print the type of x
print(typeof(X))

# Declare an integer by appending an L suffix.
X = 5L

# print the class name of y
print(class(X))

# print the type of y
print(typeof(X))

flowers <- read.table(file = "C:\\Users\\ADMIN\\Downloads\\flower.txt", 
                      header = TRUE, sep = "\t", stringsAsFactors = TRUE)

flower <- read_delim("C:/Users/ADMIN/Downloads/flower.txt", 
                     +     delim = "\t", escape_double = FALSE, 
                     +     trim_ws = TRUE)
str(flowers)
  # To view just any column in the data frame, use the $
flowers$height
flowers$nitrogen
summary(flowers$height)

#Positional index, to extract a value from data frame, you indicate both the row and column number
# If from a column, just indicate the row number.
flowers[1, 4]
# this would give you the same
flowers$height[1]

# To extract multiple values sequentially, say the first 10 rows and the first 4 columns 
flowers[1:10, 1:4]
# For non-sequential using the c() function. 
#To extract the 1st, 5th, 12th, 30th rows from the 1st, 3rd, 6th and 8th columns
flowers[c(1, 5, 12, 30), c(1, 3, 6, 8)]
# To extract the first 8 rows and all of the columns in the flower data frame
flowers[1:8, ]
# or all of the rows and the first 3 columns
flowers[, 1:3]
# We can even use negative positional indexes to exclude certain rows and columns. As an example, lets 
#extract all of the rows except the first 85 rows and all columns except the 4th, 7th and 8th columns
flowers[-(1:85), -c(4, 7, 8)]
#can also name the variables directly when using the square bracket [ ] notation. For example, 
# let’s extract the first 5 rows and the variables treat, nitrogen and leafarea. 
#Instead of using flowers[1:5, c(1, 2, 6)] we can instead use
flowers[1:5, c("treat", "nitrogen", "leafarea")]

#Logical index - without specifying the number of column after the , means all columns be displayed 
big_flowers <- flowers[flowers$height > 12, ]
big_flowers
flowers[flowers$height >= 6, ]        # values greater or equal to 6

flowers[flowers$height <= 6, ]          # values less than or equal to 6

flowers[flowers$height == 8, ]         # values  equal to 8

flowers[flowers$height != 8, ]         # values  not equal to 8

# We can also extract rows based on the value of a character string or factor level.
# Note: the double equals == sign must be used for a logical test 
#and that the character string must be enclosed in either single or double quotes (i.e. "high").
nit_high <- flowers[flowers$nitrogen == "high", ]        
nit_high

# Or we can extract all rows where nitrogen level is not equal to medium (using !=) 
# and only return columns 1 to 4.
nit_not_medium <- flowers[flowers$nitrogen != "medium", 1:4]    
nit_not_medium

# Logical test in combination with Boolean expression
low_notip_heigh6 <- flowers[flowers$height >= 6 & flowers$nitrogen == "medium" &
                              flowers$treat == "notip",]        
low_notip_heigh6
height2.2_12.3 <- flowers[flowers$height > 12.3 | flowers$height < 2.2, ]        
height2.2_12.3

# An alternative method of selecting parts of a data frame based on a logical expression is to 
# use the subset() function instead of the [ ]. The advantage of using subset() is that you 
# no longer need to use the $ notation when specifying variables inside the data frame 
tip_med_2 <- subset(flowers, treat == "tip" & nitrogen == "medium" & block == 2)
tip_med_2
# Using names of variable
subset(flowers, treat == "tip" & nitrogen == "medium" & block == 2,
       c("treat", "nitrogen", "leafarea"))
subset(flowers, treat == "tip" & nitrogen == "medium" & block == 2, 
       select = c("treat", "nitrogen", "leafarea"))

# using [] notation including all columns
flowers [flowers$treat == "tip" & flowers$nitrogen == "medium" & flowers$block == 2,]
# showing just column 3, 4
flowers [flowers$treat == "tip" & flowers$nitrogen == "medium" & flowers$block == 2,c(3,4)]
# Using names of variable
flowers [flowers$treat == "tip" & flowers$nitrogen == "medium" & flowers$block == 2,c("nitrogen", "treat", "block")]

# To order
height_ord <- flowers[order(flowers$height), ]        
height_ord
leafarea_ord <- flowers[order(flowers$leafarea, decreasing = TRUE), ]        
leafarea_ord
# For multiple variables - ascending
block_height_ord <- flowers[order(flowers$block, flowers$height), ]        
block_height_ord

# Ascending and Descending (use of - for descending, works just for numerical values)
block_revheight_ord <- flowers[order(flowers$block, -flowers$height), ]        
block_revheight_ord

# For a factor (or character) variable like nitrogen, the function xtfrm() will be used 
# for this variable inside our order() function.

block_revheight_ord <- flowers[order(-xtfrm(flowers$nitrogen), flowers$height), ]        
block_revheight_ord

# rbind and cbind to aad rows or columns to dataset.

?rbind
