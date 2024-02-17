#Loading the dataset
dataset = read.csv("Student_Performance.csv")

#install.packages("caTools")
library(caTools)#loading the package after installing it 
set.seed(123)# helps to get same output on multiple runs

# Splitting the Dataset into Training and Testing set
split = sample.split(dataset$Performance.Index, SplitRatio = 0.9)
print(split)

training_set = subset(dataset, split== TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting the Multiple Linear Regression Model using Training Set
regressor = lm(formula = Performance.Index ~ ., data = training_set)#takes weekly sales as dependent and others a independent 

print(regressor)

# Predicting the Test Set Results
y_pred = predict(regressor, newdata = test_set)

print(y_pred)
print(test_set$Performance.Index)