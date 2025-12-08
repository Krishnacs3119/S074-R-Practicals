install.packages("lubridate")


library(lubridate)
library(dplyr)
library(readr)

df <- read_csv("Food_Delivery_Route_Efficiency_Dataset.csv")

# ----------------------------------------------------------------------

processed_data <- df %>%
  mutate(
    Actual_Timestamp = ymd_hm(order_time),
    Year_Num = year(Actual_Timestamp),
    Month_Num = month(Actual_Timestamp),
    Month_Name = month(Actual_Timestamp, label = TRUE),
    Day_Num = day(Actual_Timestamp),
    Weekday_Num = wday(Actual_Timestamp),
    Weekday_Name = wday(Actual_Timestamp, label = TRUE, abbr = FALSE),
    Quarter = quarter(Actual_Timestamp),
    Day_of_Year = yday(Actual_Timestamp),
    Hour = hour(Actual_Timestamp),
    Minute = minute(Actual_Timestamp)
  ) %>%
  select(order_id, order_time, Actual_Timestamp, Year_Num, Month_Name, Day_Num, Weekday_Name, Quarter, Hour, Minute)

print("--- Data with Extracted Date and Time Components ---")
print(head(processed_data))

# ----------------------------------------------------------------------

current_time <- now()
print("--- Current Time Extraction ---")
print(paste("Current Year:", year(current_time)))
print(paste("Current Hour:", hour(current_time)))
print(paste("Current Minute:", minute(current_time)))