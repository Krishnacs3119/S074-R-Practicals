library(dplyr) 

orders <- read.csv("fast_food_ordering_dataset.csv")

print("--- Original Dataset (First 3 rows) ---")
print(head(orders, 3))

selected_cols <- orders %>%
  select(order_id, city, order_value)

print("--- Selected Specific Columns ---")
print(head(selected_cols, 3))

range_cols <- orders %>%
  select(order_id:cuisine_type)

print("--- Selected Range of Columns ---")
print(head(range_cols, 3))

starts_with_c <- orders %>%
  select(starts_with("c"))

print("--- Selected columns starting with 'c' ---")
print(head(starts_with_c, 3))

dropped_one <- orders %>%
  select(-items_count)

print("--- Dataset with 'items_count' dropped ---")
print(names(dropped_one)) # Printing names to verify it's gone

dropped_multiple <- orders %>%
  select(-delivery_time_minutes, -payment_method)

print("--- Dataset with specific columns dropped ---")
print(names(dropped_multiple))

dropped_range <- orders %>%
  select(-(city:order_value))

print("--- Dataset with range 'city' to 'order_value' dropped ---")
print(names(dropped_range))