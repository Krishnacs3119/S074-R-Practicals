library(dplyr)
library(tidyr) # Used to clean the data first

df <- read.csv("Indian telecommunications market.csv", na.strings = c("", "NA"))

df_subset <- df %>%
  select(Region = 2, Tech = 4, Drop_Rate = 11, Rating = 21)

df_clean <- df_subset %>%
  mutate(
    Rating = replace_na(Rating, 0),
    Drop_Rate = replace_na(Drop_Rate, 0)
  )

print("--- Cleaned Baseline Data ---")
print(head(df_clean))

df_calc <- df_clean %>%
  mutate(
    Penalty = Drop_Rate * 0.5,          # Step 1: Calc penalty (half of drop rate)
    Adjusted_Score = Rating - Penalty   # Step 2: Subtract from Rating
  )

print("--- Method A: Arithmetic Results (Adjusted Score) ---")
print(df_calc %>% select(Rating, Drop_Rate, Adjusted_Score))

df_logic <- df_clean %>%
  mutate(
    Satisfaction_Label = ifelse(Rating > 8.0, "High", "Average/Low"),
    # Let's add a second logic: Is the call drop rate critical?
    Connection_Status = ifelse(Drop_Rate > 7, "Unstable", "Stable")
  )

print("--- Method B: Logic Results (Labels) ---")
print(df_logic %>% select(Rating, Satisfaction_Label, Drop_Rate, Connection_Status))

df_text <- df_clean %>%
  mutate(
    # paste connects strings with a space by default
    User_Profile = paste(Region, "user on", Tech, "network")
  )
print("--- Method C: Text Transformation ---")
print(head(df_text$User_Profile))

final_dataset <- df_clean %>%
  mutate(
    Adjusted_Score = Rating - (Drop_Rate * 0.5),
    Is_Top_Tier = ifelse(Adjusted_Score > 7, TRUE, FALSE),
    Status_Report = paste0("Region: ", Region, " / Score: ", round(Adjusted_Score, 1))
  )

print("--- Final Combined Dataset ---")
print(head(final_dataset))