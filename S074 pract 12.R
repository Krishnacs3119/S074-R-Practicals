library(dplyr)
library(tidyr)
library(readr)

car_df <- read_csv("car_price_prediction_.csv")

business_df <- read_delim("Business_sales_EDA.csv", delim = ";")

print("--- Data Structure Before Transformation ---")
print("Car Data Columns:")
print(names(car_df))
print("Business Data Columns:")
print(names(business_df))


car_clean <- car_df %>%
  select(Brand, Price) %>%
  rename(Source = Brand, Value = Price) %>%
  mutate(
    Dataset = "Car",
    Value = as.numeric(Value)
  ) %>%
  filter(!is.na(Value))

business_clean <- business_df %>%
  select(brand, price) %>%
  rename(Source = brand, Value = price) %>%
  mutate(
    Dataset = "Business",
    Value = as.numeric(Value)
  ) %>%
  filter(!is.na(Value))


combined_data <- rbind(car_clean, business_clean)

car_rows <- nrow(car_clean)
business_rows <- nrow(business_clean)
total_rows <- nrow(combined_data)

print("--- Combined Data Summary ---")
print(paste("Car rows:", car_rows))
print(paste("Business rows:", business_rows))
print(paste("Total rows (Expected):", car_rows + business_rows))
print(paste("Total rows (Actual):", total_rows))

print("--- Preview of Combined Data (Top - Car Data) ---")
print(head(combined_data))

print("--- Preview of Combined Data (Bottom - Business Data) ---")
print(tail(combined_data))