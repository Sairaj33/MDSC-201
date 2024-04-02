#1a
dataset = read.csv("songs.csv")

correlation_coefficient <- cor(dataset$Months, dataset$'X.Songs')
correlation_coefficient

#1c
# Data coefficients got from excel
B1 <- 21.12638093
B0 <- -12.88728849

# scatter plot 
plot(dataset$Months, dataset$X.Songs, main = "Scatter Plot", 
     xlab = "Months", ylab = "X.Songs")

# Function to generate the fitted line
get_equation <- function(b1, b0) {
  paste0("y = ", format(b1, digits = 4), " * x + ", format(b0, digits = 4))
}

# Get equation string
equation <- get_equation(B1, B0)

# Add the fitted line
abline(a = B0, b = B1, lty = 2, col = "red", label = equation)  

# display the equation
legend("topleft", legend = equation, bty = "n")

#################################################################################


