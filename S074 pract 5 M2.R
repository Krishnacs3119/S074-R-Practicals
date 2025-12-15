# Load data
data <- read.csv("Food_Delivery_Route_Efficiency_Dataset.csv")

# Convert traffic_level to factor
data$traffic_level <- factor(data$traffic_level, levels = c("Low", "Medium", "High"))

# Independent two-sample t-test: High vs Low traffic
high_low <- subset(data, traffic_level %in% c("High", "Low"))
t.test(delivery_time_min ~ traffic_level, data = high_low)

# Independent two-sample t-test: Medium vs Low traffic
medium_low <- subset(data, traffic_level %in% c("Medium", "Low"))
t.test(delivery_time_min ~ traffic_level, data = medium_low)

# Independent two-sample t-test: High vs Medium traffic
high_medium <- subset(data, traffic_level %in% c("High", "Medium"))
t.test(delivery_time_min ~ traffic_level, data = high_medium)
