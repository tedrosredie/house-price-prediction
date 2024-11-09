# load the package
library(VGAM)

# load data
data("iris")
data(iris)

# fit model
fit <- vglm(Species~., family=multinomial, data=iris)

# summarize the fit
summary(fit)

# make predictions
probabilities <- predict(fit, iris[,1:4], type="response")
predictioins <- apply(probabilities, 1, which.max)
predictions[which(predictions=="1")] <- levels(iris$Species)[1]
predictions[which(predictions=="2")] <- levels(iris$Species)[2]
predictions[which(predictions=="3")] <- levels(iris$Species)[3]

#summarize accuracy
table(predictions, iris$Species)
