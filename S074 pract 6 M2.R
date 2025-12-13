df <- read.csv("python_learning_exam_performance.csv")

set.seed(42)
print("--- 6. Paired t-test ---")

df$midterm_score <- df$final_exam_score - runif(nrow(df), min = -5, max = 10)

t_test_paired <- t.test(df$final_exam_score, df$midterm_score, paired = TRUE)
print(t_test_paired)