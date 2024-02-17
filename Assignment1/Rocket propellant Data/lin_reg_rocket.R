# Simple Linear Regression

# Importing the Dataset
dataset = read.csv("The Rocket propellant Data.csv")

# Splitting the Dataset into Training and Testing set
#install.packages("caTools")

library(caTools)
set.seed(123)
split = sample.split(dataset$Shear_strength, SplitRatio = 2/3)
print(split)

training_set = subset(dataset, split== TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting the Simple Linear Regression Model using Training Set

regressor = lm(formula = Shear_strength ~ Age_of_propellant,data = training_set)
print(regressor)


# Predicting the Test Set Results
y_pred = predict(regressor, newdata = test_set)


print(y_pred)

# Visualizing the Training Set Results
#install.packages("ggplot2")
install.packages("farver")
library(ggplot2)
ggplot() + 
  geom_point(aes(x= training_set$Age_of_propellant, 
                 y = training_set$Shear_strength),
             colour = "red") +
  geom_line(aes(x= training_set$Age_of_propellant, 
                y = predict(regressor, newdata = training_set)),
            colour = "blue") +
  ggtitle("Shear_strength Vs Age_of_propellant (Training Set Results)") +
  xlab("Age_of_propellant") +
  ylab("Shear_strength")

### Visualizing the Testing Set Results
ggplot() + 
  geom_point(aes(x= test_set$Age_of_propellant, 
                 y = test_set$Shear_strength),
             colour = "red") +
  geom_line(aes(x= test_set$Age_of_propellant, 
                y = y_pred),
            colour = "blue") +
  ggtitle("Shear_strength Vs Age_of_propellant (Testing Set Results)") +
  xlab("Age_of_propellant") +
  ylab("Shear_strength")



