# Example from: https://www.tutorialspoint.com/r/r_boxplots.htm
# Understand boxplot: https://www.wellbeingatschool.org.nz/information-sheet/understanding-and-interpreting-box-plots

input <- mtcars[,c('mpg','cyl')]
print(head(input))

# Box plot relation between mpg (miles per gallon) and cyl (number of cylenders):
boxplot(mpg ~ cyl, data = mtcars, xlab = "Number of Cylinders",
        ylab = "Miles Per Gallon", main = "Mileage Data")
