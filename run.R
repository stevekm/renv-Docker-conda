#!/usr/bin/env Rscript

library(ggplot2)
ggplot(iris, aes(x=Sepal.Length, y=Petal.Length)) + geom_point()


# uncomment these lines, then run
# renv::install("data.table")
# renv::snapshot()


# UNCOMMENT THIS:
# library("data.table")
# data.table(iris)


# then, comment out the line `library("data.table")` and run
# renv::clean()
# renv::snapshot()