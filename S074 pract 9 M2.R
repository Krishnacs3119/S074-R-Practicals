print("Name: S074 Krishna")

data <- read.csv("youtube_shorts_performance_dataset.csv")


table_data <- table(data$category, data$upload_hour)

chisq_result <- chisq.test(table_data)
chisq_result

head(data)