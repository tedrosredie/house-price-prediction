# Load the packages
library(MASS)
data(iris)

#fit model
fit <- lda(Species~., data=iris)

# summarize the fit
summary(fit)

# make predictions
predictions <- predict(fit, iris[,1:4])$class

# summary accuracy
table(predictions, iris$Species)
