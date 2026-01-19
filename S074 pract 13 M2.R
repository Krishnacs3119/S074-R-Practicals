retail <- read.csv("Retail Product.csv")

retail_data <- retail[, c("Price", "Rating", "Discount")]
retail_clean <- na.omit(retail_data)

retail_50 <- retail_clean[1:50, ]

model <- lm(Price ~ Rating + Discount, data = retail_50)

plot(retail_50$Rating, retail_50$Price,
     main = "Linear Regression: Price vs Rating (First 50 Rows)",
     xlab = "Rating",
     ylab = "Price",
     pch = 16)

abline(lm(Price ~ Rating, data = retail_50),
       col = "red", lwd = 2)
