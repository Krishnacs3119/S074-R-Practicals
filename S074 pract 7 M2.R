print("Name: S074 Krishna")

data <- read.csv("fast_food_ordering_dataset.csv")


anova_result <- aov(delivery_time_minutes ~ cuisine_type, data = data)
summary(anova_result)

head(data)