library(dplyr)
library(readr)

df <- read_csv("student_performance_analysis.csv")

print("--- 1. Original Dataset (Head and Info) ---")
print(head(df))
cat(paste("Total rows:", nrow(df), "\n"))


duplicates_report <- df %>%
  group_by(student_id, gender, hours_studied, attendance_percent, assignments_completed, test_score) %>%
  count() %>%
  filter(n > 1)

print("--- 2. Identification Report (Rows that are duplicated) ---")
if (nrow(duplicates_report) == 0) {
  print("Result: No exact duplicate rows found in the dataset.")
} else {
  print(duplicates_report)
}


clean_exact <- df %>%
  distinct()

print("--- 3. Removed Exact Duplicates (distinct) ---")
cat(paste("Original rows:", nrow(df), "\n"))
cat(paste("Clean exact rows:", nrow(clean_exact), "\n"))
print(head(clean_exact, 10))


unique_students <- df %>%
  distinct(student_id, .keep_all = TRUE)

print("--- 4. Unique Students Only (Partial Duplicates removed) ---")
cat(paste("Original rows:", nrow(df), "\n"))
cat(paste("Unique student ID rows:", nrow(unique_students), "\n"))
print(head(unique_students, 10))
