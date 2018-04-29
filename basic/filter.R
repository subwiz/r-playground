# Example requires MASS package.
# install.packages("MASS")

library("MASS")

usa <- Cars93$Horsepower[Cars93$Origin == "USA"]
head(usa)
