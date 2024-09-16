# Load required libraries
library(datasets)  # For datasets like Iris
library(dplyr)     # For data manipulation
library(class)     # For k-Nearest Neighbors algorithm

# Load Iris dataset from sklearn.datasets
iris_data <- datasets::iris

# Or Load Iris dataset directly from the web
url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"
iris_data1 <- read.csv(url, header = FALSE)
# Add column names
colnames(iris_data) <- c('sepal_length', 'sepal_width', 'petal_length', 'petal_width', 'class')


# Display the first few rows of the dataset
head(iris_data)

# Split the dataset into features (x) and target variable (y)
x <- iris_data[, -5]  # Features: all columns except the last one
y <- iris_data$Species  # Target variable: Species column

# Encode the target variable from strings to numerical equivalents
y <- as.integer(factor(y))

# Split the dataset into training and testing sets
set.seed(123)  # For reproducibility
train_index <- sample(1:nrow(iris_data), 0.7 * nrow(iris_data))  # 70% for training
x_train <- x[train_index, ]
y_train <- y[train_index]
x_test <- x[-train_index, ]
y_test <- y[-train_index]

# Train the k-Nearest Neighbors (KNN) classifier
k <- 3  # Number of neighbors to consider
knn_model <- knn(train = x_train, test = x_test, cl = y_train, k = k)

# Predict the classes for test data
predictions <- knn_model

# what was predicted
 y_test

# Calculate the accuracy of the model
accuracy <- mean(predictions == y_test)
accuracy




# Part 2, not working though 

# Convert predictions to a factor
predictions <- as.factor(predictions)

# Convert y_test to a factor (if not already)
y_test <- as.factor(y_test)

# Check if levels are the same, if not, unify them
if (!identical(levels(predictions), levels(y_test))) {
  levels_to_keep <- union(levels(predictions), levels(y_test))
  predictions <- factor(predictions, levels = levels_to_keep)
  y_test <- factor(y_test, levels = levels_to_keep)
}

# Compute precision, recall, and F1-score
precision <- caret::precision(predictions, y_test)
recall <- caret::recall(predictions, y_test)
f1_score <- caret::F1_Score(predictions, y_test)

# Convert predictions and y_test to factors (if not already)
predictions <- as.factor(predictions)
y_test <- as.factor(y_test)

# Check levels before unification
print(levels(predictions))
print(levels(y_test))

# Check if levels are the same, if not, unify them
if (!identical(levels(predictions), levels(y_test))) {
  levels_to_keep <- union(levels(predictions), levels(y_test))
  predictions <- factor(predictions, levels = levels_to_keep)
  y_test <- factor(y_test, levels = levels_to_keep)
}

# Check levels after unification
print(levels(predictions))
print(levels(y_test))

# Compute precision
precision <- caret::precision(predictions, y_test)


# Check data type
print(class(predictions))
print(class(y_test))

# Inspect values
print(unique(predictions))
print(unique(y_test))

# Verify function parameters
args(caret::precision.default)

# Hyperparameter tuning with cross-validation
tuned_model <- train(x_train, y_train, method = "algorithm", 
                     tuneGrid = grid, trControl = trainControl(method = "cv"))

# Example: Feature engineering
x_train <- preprocess(x_train)
x_test <- preprocess(x_test)

# Ensemble learning with random forest
ensemble_model <- randomForest(y_train ~ ., data = x_train)

# Deploy the model
saveRDS(trained_model, "trained_model.rds")

# Model monitoring
new_data <- read.csv("new_data.csv")
predictions <- predict(trained_model, newdata = new_data)



