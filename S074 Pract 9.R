library(stringr)
library(tidyr)
library(dplyr)

shorts_data <- read.csv("youtube_shorts_performance_dataset.csv")

print("--- Original Dataset (First 3 Rows) ---")
print(head(shorts_data, 3))

shorts_data$ID_Prefix <- str_sub(shorts_data$video_id, 1, 3)

shorts_data$ID_Number <- str_sub(shorts_data$video_id, -4, -1)

print("--- Data after str_sub() ---")
print(head(shorts_data %>% select(video_id, ID_Prefix, ID_Number)))

split_list <- str_split(shorts_data$title, "#")
print("--- Basic Split Output (List format) ---")
print(split_list[[1]]) 

split_matrix <- str_split(shorts_data$title, "#", simplify = TRUE)

shorts_data$Series_Name <- split_matrix[, 1] 
shorts_data$Episode_Num <- split_matrix[, 2] 

print("--- Data after str_split() (Manual Assignment) ---")
print(head(shorts_data %>% select(title, Series_Name, Episode_Num)))


tidy_data <- shorts_data %>%
  separate(video_id, into = c("Type", "Unique_ID"), sep = "_")

print("--- Bonus: The 'separate' function (easier splitting) ---")
print(head(tidy_data %>% select(Type, Unique_ID)))