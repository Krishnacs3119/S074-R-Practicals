df <- read.csv("Food_Delivery_Route_Efficiency_Dataset.csv")

t_test_one <- t.test(df$delivery_time_min, mu = 45)

print(t_test_one)
