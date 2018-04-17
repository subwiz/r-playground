# Example from: https://www.tutorialspoint.com/r/r_pie_charts.htm

## Simple

# Create data for the graph.
x <- c(21, 62, 10, 53)
labels <- c("London", "New York", "Singapore", "Mumbai")

# Plot the chart with title and rainbow color pallet.
pie(x, labels, main = "City pie chart", col = rainbow(length(x)))

## Data

# Create data for the graph.
x <-  c(21, 62, 10, 53)
labels <-  c("London","New York","Singapore","Mumbai")

piepercent <- round(100*x/sum(x), 1)

# Plot the chart.
pie(x, labels = piepercent, main = "City pie chart",col = rainbow(length(x)))
legend("topright", c("London","New York","Singapore","Mumbai"), cex = 0.8,
       fill = rainbow(length(x)))

## 3D

library(plotrix)

# Create data for the graph.
x <-  c(21, 62, 10, 53)
lbl <-  c("London","New York","Singapore","Mumbai")

# Plot the chart.
pie3D(x,labels = lbl,explode = 0.1, main = "Pie Chart of Countries ")
