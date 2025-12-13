library(dplyr)
library(psych)  

df <- read.csv("car_price_prediction_.csv")
mean_price <- mean(df$Price)
df$Value_Group <- ifelse(df$Price > mean_price, "High Value", "Standard")

print("--- 1. Descriptive Statistics for Car Data ---")
print("Summary of Price:")
summary(df$Price)

print("Detailed Description of Mileage:")
describe(df$Mileage)
