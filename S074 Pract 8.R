install.packages("tidyr")

library(dplyr)
library(tidyr)

usage_df <- read.csv("random_smartphone_usage_dataset.csv", na.strings = c("", "NA"))

print("--- 1. Original Data (First 6 Rows) ---")
print(head(usage_df))

print("--- Count of Missing Values per Column ---")
print(colSums(is.na(usage_df)))


clean_omit <- na.omit(usage_df)

print("--- 2. Data after na.omit() ---")
print(paste("Original rows:", nrow(usage_df)))
print(paste("Rows remaining:", nrow(clean_omit)))
print(head(clean_omit))


avg_screen_time <- mean(usage_df$Daily_Screen_Time_Min, na.rm = TRUE)

clean_replace <- usage_df %>%
  replace_na(list(
    Primary_App_Category = "Unknown",
    Daily_App_Opens = 0,
    Notifications_Received = 0,
    Daily_Screen_Time_Min = avg_screen_time
  ))

print("--- 3. Data after replace_na() ---")
print(head(clean_replace))

print("--- Remaining NAs after replacement ---")
print(colSums(is.na(clean_replace)))