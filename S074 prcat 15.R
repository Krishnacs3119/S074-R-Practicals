library(lubridate)
library(dplyr)
library(readr)

df <- read_csv("python_learning_exam_performance.csv")
print("--- Data Loaded (First 6 Rows) ---")
print(head(df))

# ----------------------------------------------------------------------

print("--- OUTPUT OF str() ---")
str(df)

# ----------------------------------------------------------------------

print("--- OUTPUT OF summary() [Before Factor Conversion] ---")
summary(df)

# ----------------------------------------------------------------------

df$prior_programming_experience <- as.factor(df$prior_programming_experience)
df$country <- as.factor(df$country)

print("--- OUTPUT OF summary() [After Factor Conversion] ---")
summary(df)

# ----------------------------------------------------------------------

avg_score <- mean(df$final_exam_score, na.rm = TRUE)
max_hours_study <- max(df$hours_spent_learning_per_week, na.rm = TRUE)

print("--- Accessing Specific Summaries ---")
print(paste("Average Final Exam Score:", round(avg_score, 2)))
print(paste("Highest Hours Spent Learning per Week:", round(max_hours_study, 1)))