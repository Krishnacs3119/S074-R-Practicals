
library(dplyr)


# 1. SETUP: Create Two New Example Datasets

# Dataset 1: Student Marks in Midterm
midterm_marks <- data.frame(
  Roll = c(101, 102, 103),
  Name = c("Krishna", "Ansh", "Kunal"),
  Midterm = c(99, 85, 92)
)

# Dataset 2: Student Attendance
attendance <- data.frame(
  Roll = c(101, 102, 103),
  Name = c("Krishna", "Ansh", "Kunal"),
  Attendance = c(99, 91, 95)
)

# Dataset 3: New Admissions (Appending Example)
new_students <- data.frame(
  Roll = c(104, 105),
  Name = c("Harsh", "Soham"),
  Midterm = c(74, 69)
)

print("--- Midterm Marks ---")
print(midterm_marks)
print("--- Attendance Data ---")
print(attendance)


# 2. MERGE (Joining Columns)

merged_output <- merge(midterm_marks, attendance, by = c("Roll", "Name"))

print("--- Merged Data (Marks + Attendance) ---")
print(merged_output)


# 3. APPEND (Stacking Rows)

final_students <- bind_rows(midterm_marks, new_students)

print("--- Appended Data (Existing + New Students) ---")
print(final_students)
