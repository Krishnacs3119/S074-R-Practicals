library(dplyr)
library(readr)

ipl <- read_csv("ipl.csv")

ipl_sorted_cost <- ipl |>
  arrange(`COST IN ₹ (CR.)`)
head(ipl_sorted_cost, 5)

ipl_sorted_cost_desc <- ipl |>
  arrange(desc(`COST IN ₹ (CR.)`))
head(ipl_sorted_cost_desc, 5)

ipl_sorted_type_cost <- ipl |>
  arrange(TYPE, desc(`COST IN ₹ (CR.)`))
head(ipl_sorted_type_cost, 10)

high_cost_sorted_team <- ipl |>
  filter(`COST IN ₹ (CR.)` > 5) |>
  arrange(Team)
head(high_cost_sorted_team)

low_dollar_sorted <- ipl |>
  arrange(`Cost IN $ (000)`)
head(low_dollar_sorted, 5)
