library(dplyr)

df <- read.csv("Business_sales_EDA.csv", sep = ";")

print("--- 2. Frequency Tables (Section Distribution) ---")
section_counts <- table(df$section)
print("--- A. Using Base R table() (Vector Output) ---")
print(section_counts)

section_df <- df %>% count(section)
print("\n--- B. Using dplyr::count() (Data Frame Output) ---")
print(section_df)