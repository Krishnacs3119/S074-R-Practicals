data <- read.csv("Indian telecommunications market.csv")

outcome_col <- grep(
  "tilting.towards.a.monopoly",
  names(data),
  ignore.case = TRUE,
  value = TRUE
)

data$Outcome <- ifelse(data[[outcome_col]] == "Yes", 1, 0)

region_col   <- grep("region", names(data), ignore.case = TRUE, value = TRUE)
location_col <- grep("location", names(data), ignore.case = TRUE, value = TRUE)
tech_col     <- grep("tech", names(data), ignore.case = TRUE, value = TRUE)

model <- glm(
  Outcome ~ get(region_col) + get(location_col) + get(tech_col),
  data = data,
  family = binomial
)

summary(model)

logit_values <- predict(model, type = "link")
prob_values  <- predict(model, type = "response")

plot(
  logit_values,
  prob_values,
  pch = 19,
  main = "Logistic Regression (Sigmoid Curve)",
  xlab = "Logit (Linear Predictor)",
  ylab = "Predicted Probability"
)

logit_seq <- seq(min(logit_values), max(logit_values), length.out = 200)
sigmoid   <- 1 / (1 + exp(-logit_seq))

lines(logit_seq, sigmoid, lwd = 2)

library(writexl)

model_summary <- summary(model)

results <- as.data.frame(model_summary$coefficients)

write.csv(
  results,
  "logistic_regression_results.csv",
  row.names = TRUE
)

write_xlsx(
  results,
  "logistic_regression_results.xlsx"
)

pdf("logistic_regression_results.pdf")
plot.new()
text(
  0, 1,
  paste(capture.output(print(results)), collapse = "\n"),
  adj = c(0, 1),
  cex = 0.7
)
dev.off()
