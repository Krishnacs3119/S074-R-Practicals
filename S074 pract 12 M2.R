library(readr)

data <- read_csv("data.csv")

numeric_data <- data[sapply(data, is.numeric)]

correlation_matrix <- cor(numeric_data, use = "complete.obs")

print(correlation_matrix)
