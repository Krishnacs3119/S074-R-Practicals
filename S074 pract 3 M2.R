car_data <- read.csv("car_price_prediction_.csv", stringsAsFactors = TRUE)
head(car_data)

brand_table <- table(car_data$Brand)
print("Frequency of Brand:")
print(brand_table)

fuel_table <- table(car_data$Fuel.Type)
print("Frequency of Fuel Type:")
print(fuel_table)

trans_table <- table(car_data$Transmission)
print("Frequency of Transmission:")
print(trans_table)

cond_table <- table(car_data$Condition)
print("Frequency of Condition:")
print(cond_table)

brand_fuel_table <- table(car_data$Brand, car_data$Fuel.Type)
print("Brand vs Fuel Type:")
print(brand_fuel_table)

trans_cond_table <- table(car_data$Transmission, car_data$Condition)
print("Transmission vs Condition:")
print(trans_cond_table)

brand_fuel_prop <- prop.table(brand_fuel_table)
print("Proportion - Brand vs Fuel Type:")
print(round(brand_fuel_prop, 2))

trans_cond_prop <- prop.table(trans_cond_table)
print("Proportion - Transmission vs Condition:")
print(round(trans_cond_prop, 2))

brand_fuel_margins <- addmargins(brand_fuel_table)
print("Brand vs Fuel Type with Totals:")
print(brand_fuel_margins)

trans_cond_margins <- addmargins(trans_cond_table)
print("Transmission vs Condition with Totals:")
print(trans_cond_margins)
