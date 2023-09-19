#!/usr/bin/env Rscript

library(ggplot2)
ggplot(iris, aes(x=Sepal.Length, y=Petal.Length)) + geom_point()

