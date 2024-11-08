# Load required libraries
library(tidyverse)
library(caret)

# Set seed for reproducibility
set.seed(123)

# Generate sample data
n <- 1000
square_feet <- runif(n, min =1000, max = 5000)
price <- 50000 + 100* square_feet + rnorm(n, mean = 0, sd = 10000)

# Create a dataframe
house_data <- data.frame(square_feet, price)

# Split the data into training and testing sets
train_index <- createDataPartition(house_data$price, p = 0.8, list = FALSE)
train_data <- house_data[train_index,]
test_data <- house_data[train_index,]

# Train the linear regression model
model <- lm(price ~ square_feet, data = train_data)

# Make predictions on the test data
predictions <- predict(model, newdata = test_data)

#Calculate the RMSE
rmse <- sqrt(mean((test_data$price - predictions)^ 2))

# Print model summary and RMSE
print((summary(model)))
cat("RMSE:", rmse, "\n")

# Plot the results
ggplot(house_data, aes(x = square_feet, y = price)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = "House Price Prediction",
       x = "Square Feet",
       y = "Price") +
  theme_minimal()

#Save the plot
ggsave("house_price_prediction_plot_png", width = 8, height = 6)
getwd()

