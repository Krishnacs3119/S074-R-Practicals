print("Name: S074 Krishna")

data <- read.csv("ipl.csv")

anova_result <- aov(COST.IN....CR.. ~ TYPE * Team, data = data)
summary(anova_result)

head(data)
