library(dplyr)
library(psych)

# Load the CSV dataset from working directory
suicide <- read.csv("Age-standardized suicide rates.csv", 
                    stringsAsFactors = FALSE)

# Clean column names
colnames(suicide) <- make.names(colnames(suicide))

# Calculate total suicide rates across selected years for each row
suicide$Total_Suicide_Rate <- suicide$X2016 + suicide$X2015 + 
  suicide$X2010 + suicide$X2000

# Calculate average suicide rate for each row
suicide$Average_Suicide_Rate <- suicide$Total_Suicide_Rate / 4

# Create risk group based on average suicide rate
suicide$Risk_Group <- ifelse(suicide$Average_Suicide_Rate >= 15, "High", "Low")

# Display descriptive statistics using summary()
summary(suicide$Total_Suicide_Rate)
summary(suicide$Average_Suicide_Rate)

# Display detailed descriptive statistics using describe()
describe(suicide[, c("X2016", "X2015", "X2010", "X2000", "Total_Suicide_Rate")])
