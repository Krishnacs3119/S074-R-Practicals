library(dplyr)
library(tidyr)
library(readr)

df <- read_csv("Age-standardized suicide rates.csv") %>%
  mutate(RecordID = row_number()) %>%
  select(RecordID, Country, Sex, '2016', '2015', '2010', '2000')

df <- df %>%
  mutate(across(c(`2016`, `2015`, `2010`, `2000`), as.numeric))

print("--- 1. Original Wide Data ---")
print(head(df))

# ----------------------------------------------------------------------

long_df <- df %>%
  pivot_longer(
    cols = c(`2016`, `2015`, `2010`, `2000`),
    names_to = "Year",
    values_to = "Rate"
  ) %>%
  mutate(Year = as.integer(Year))

print("--- 2. Long Format (pivot_longer) ---")
print(head(long_df, 8))

# ----------------------------------------------------------------------

wide_df_original <- long_df %>%
  pivot_wider(
    names_from = Year,
    values_from = Rate
  )

print("--- 3. Wide Format (Back to Original using pivot_wider) ---")
print(head(wide_df_original))

# ----------------------------------------------------------------------

sex_pivot_df <- long_df %>%
  pivot_wider(
    id_cols = c(Country, Year),
    names_from = Sex,
    values_from = Rate
  )

print("--- 4. Sex Pivot (Spreading 'Sex') ---")
print(head(sex_pivot_df))

# write_csv(sex_pivot_df, "Suicide_Rates_Pivoted_by_Sex_R.csv")