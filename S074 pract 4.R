library(dplyr)
library(readr)

ipl <- read_csv("ipl.csv")

head(ipl)

high_cost_subset <- subset(ipl, `COST IN ₹ (CR.)` > 10)
cat("Number of players with cost > 10 Cr:", nrow(high_cost_subset), "\n")
summary(high_cost_subset$`COST IN ₹ (CR.)`)

draft_allrounders <- subset(ipl, TYPE == "ALL-ROUNDER" & `Base Price` == "Draft Pick")
cat("Number of ALL-ROUNDERS with Draft Pick:", nrow(draft_allrounders), "\n")
head(draft_allrounders)

special_players <- subset(
  ipl,
  grepl("lakh", tolower(`Base Price`)) | `Cost IN $ (000)` > 300
)
cat("Special players (Lakh OR $ > 300K):", nrow(special_players), "\n")
head(special_players)

low_cost_filter <- ipl %>%
  filter(`COST IN ₹ (CR.)` < 2)
cat("Players with cost < 2 Cr:", nrow(low_cost_filter), "\n")
summary(low_cost_filter$`COST IN ₹ (CR.)`)

srh_expensive <- ipl %>%
  filter(`2021 Squad` == "SRH", `COST IN ₹ (CR.)` > 5)
cat("SRH players with cost > 5 Cr:", nrow(srh_expensive), "\n")
head(srh_expensive)

bat_bowl_filter <- ipl %>%
  filter(TYPE %in% c("BATTER", "BOWLER"))
cat("BATTER or BOWLER count:", nrow(bat_bowl_filter), "\n")
table(bat_bowl_filter$TYPE)
