install.packages(c("readr", "psych"))

library(readr)    # For efficient data reading
library(psych)    # For descriptive statistics

# Import your CSV file
my_data <- read.csv("studentS074.csv")

# View the first few rows
head(my_data)

# View the last few rows
tail(my_data)

# Get the dimensions (rows and columns)
dim(my_data)
cat("Dimensions (Rows, Columns): ", dim(my_data), "\n")

# Check structure (types of variables)
str(my_data)

# Summary of dataset
summary(my_data)

# Column names
names(my_data)
cat("Column Names: ", names(my_data), "\n")

# Detailed descriptive statistics
describe(my_data)

