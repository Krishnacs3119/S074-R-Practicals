# Load required libraries
library(ggplot2)
library(readr)

# Read CSV file
data <- read_csv("GamingStudy_data.csv")

# View structure
str(data)

# Bar chart example
ggplot(data, aes(x = Gender)) +
  geom_bar(fill = "steelblue") +
  labs(
    title = "Gender Distribution",
    x = "Gender",
    y = "Count"
  ) +
  theme_minimal()
