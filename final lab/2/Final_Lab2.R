dataset = read.csv("q2.csv")
#mlr
model <- lm(GGPA ~ GRE_Total + UGPA , data=dataset)

summary(model)#just to show the work of above model
#p-value
p_values <- summary(model)$coefficients[,4]
p_values
##############