library(ggplot2)
library(readr)

flight_data <- read_csv("IndianFlightdata - Sheet1.csv")

str(flight_data)

ggplot(flight_data, aes(x = Price)) +
  geom_histogram(binwidth = 1000, fill = "skyblue", color = "black") +
  labs(
    title = "Histogram of Flight Ticket Prices",
    x = "Ticket Price",
    y = "Frequency"
  ) +
  theme_minimal()

ggplot(flight_data, aes(y = Price)) +
  geom_boxplot(fill = "lightgreen") +
  labs(
    title = "Box Plot of Flight Ticket Prices",
    y = "Ticket Price"
  ) +
  theme_minimal()
