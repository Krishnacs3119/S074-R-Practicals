df <- read.csv("student_performance_analysis.csv")

# Create the grouping variable based on the median attendance
median_attendance <- median(df$attendance_percent)
df$Attendance_Group <- ifelse(df$attendance_percent > median_attendance,
                              "High Attendance",
                              "Low Attendance")

# Perform the independent two-sample t-test (comparing 'test_score' across groups)
t_test_two <- t.test(test_score ~ Attendance_Group, data = df)

# Print the results of the t-test
print(t_test_two)