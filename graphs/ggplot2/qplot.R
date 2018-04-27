# Example from qplot documentation.

library(ggplot2)

head(mtcars)

qplot(mpg, wt, data = mtcars, geom=c("point", "smooth"))
qplot(mpg, wt, data = mtcars, facets = vs ~ am)

qplot(1:10, rnorm(10), colour = runif(10))
qplot(1:10, letters[1:10])
mod <- lm(mpg ~ wt, data = mtcars)
qplot(resid(mod), fitted(mod))
