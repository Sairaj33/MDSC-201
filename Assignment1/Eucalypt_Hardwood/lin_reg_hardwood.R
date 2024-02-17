
# Simple Linear Regression

# Importing the Dataset
dataset = read.csv("eucalypt_hardwoods.csv")

# Splitting the Dataset into Training and Testing set
#install.packages("caTools")

library(caTools)
set.seed(123)
split = sample.split(dataset$hardness, SplitRatio = 2/3)
print(split)

training_set = subset(dataset, split== TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting the Simple Linear Regression Model using Training Set

regressor = lm(formula = hardness ~ density,data = training_set)
print(regressor)


# Predicting the Test Set Results
y_pred = predict(regressor, newdata = test_set)


print(y_pred)

# Visualizing the Training Set Results
#install.packages("ggplot2")
library(ggplot2)
ggplot() + 
  geom_point(aes(x= training_set$density, 
                 y = training_set$hardness),
             colour = "red") +
  geom_line(aes(x= training_set$density, 
                y = predict(regressor, newdata = training_set)),
            colour = "blue") +
  ggtitle("hardness Vs density (Training Set Results)") +
  xlab("density") +
  ylab("hardness")

### Visualizing the Testing Set Results
ggplot() + 
  geom_point(aes(x= test_set$density, 
                 y = test_set$hardness),
             colour = "red") +
  geom_line(aes(x= test_set$density, 
                y = y_pred),
            colour = "blue") +
  ggtitle("hardness Vs density (Testing Set Results)") +
  xlab("density") +
  ylab("hardness")



