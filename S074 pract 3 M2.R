df <- read.csv("Age-standardized suicide rates.csv")

print("--- 3. Cross-Tabulation (Country vs. Sex) ---")
cross_tab <- table(df$Country, df$Sex)

print(cross_tab)