library(dplyr)

data <- read.csv("student_performance_analysis.csv")

head(data)

t_test_result <- t.test(data$test_score, mu = 55)
print(t_test_result)

female_scores <- filter(data, gender == "Female")$test_score
t_test_female <- t.test(female_scores, mu = 55)
print(t_test_female)

male_scores <- filter(data, gender == "Male")$test_score
t_test_male <- t.test(male_scores, mu = 55)
print(t_test_male)

t_test_hours <- t.test(data$hours_studied, mu = 10)
print(t_test_hours)

t_test_attendance <- t.test(data$attendance_percent, mu = 70)
print(t_test_attendance)

t_test_assignments <- t.test(data$assignments_completed, mu = 8)
print(t_test_assignments)
