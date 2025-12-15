# Load CSV
data <- read.csv("python_learning_exam_performance.csv")

# View first few rows
head(data)

# Perform paired t-test: self-reported confidence vs final exam score
t_test_result <- t.test(data$self_reported_confidence_python, 
                        data$final_exam_score, 
                        paired = TRUE)

# View result
t_test_result
