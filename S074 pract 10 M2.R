library(ggplot2)
library(dplyr)
library(readr)

# Loading the dataset
gaming_data <- read_csv("GamingStudy_data.csv")

# View structure
str(gaming_data)

# Scatter plot: Hours Played vs Anxiety Score (GAD_T)
ggplot(gaming_data,
       aes(x = Hours,
           y = GAD_T,
           color = Gender)) +
  geom_point(alpha = 0.6, size = 2) +
  scale_x_log10() + # Log scale handles the wide range of play hours well
  labs(
    title = "Anxiety Score (GAD) vs Hours Played",
    x = "Hours Played per Week (log scale)",
    y = "GAD Total Score",
    color = "Gender"
  ) +
  theme_minimal()

# Pie chart: Distribution of Players by Game
gaming_data %>%
  group_by(Game) %>%
  summarise(total_players = n()) %>% # Counting rows since each row is a player
  ggplot(aes(x = "", y = total_players, fill = Game)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y") +
  labs(
    title = "Player Distribution by Game",
    fill = "Game"
  ) +
  theme_void()

# High-Low Chart: Age Range by Game
gaming_data %>%
  group_by(Game) %>%
  summarise(
    min_age = min(Age, na.rm = TRUE),
    max_age = max(Age, na.rm = TRUE)
  ) %>%
  ggplot(aes(
    x = Game,
    ymin = min_age,
    ymax = max_age
  )) +
  geom_linerange(size = 2, color = "steelblue") +
  geom_point(aes(y = min_age), color = "red", size = 3) +
  geom_point(aes(y = max_age), color = "darkgreen", size = 3) +
  labs(
    title = "High–Low Chart of Age by Game",
    x = "Game",
    y = "Age"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) # Rotated labels for readability