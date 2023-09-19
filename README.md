# `renv` and Docker Usage Notes

### Resources

- https://posit.co/blog/renv-1-0-0/
- https://rstudio.github.io/renv/articles/renv.html
- https://rstudio.github.io/renv/articles/docker.html
- https://stackoverflow.com/questions/74025052/renv-and-git-what-to-commit

## Setup

Run these commands in your R session to get started (already done here)

```R
# make sure renv is installed
install.packages("renv")

# initialize the env
# NOTE: make sure there are no `library` statements in your current codebase when you run this
renv::init()

# double check your active lib paths
.libPaths()
[1] "/Users/stevekm/projects/renv-dev1/renv/library/R-4.3/aarch64-apple-darwin20"                       
[2] "/Users/stevekm/Library/Caches/org.R-project.R/R/renv/sandbox/R-4.3/aarch64-apple-darwin20/ac5c2659"


# prior to installation, package should not be present
library("ggplot2")
Error in library("ggplot2") : there is no package called ‘ggplot2’

# install and add to renv
renv::install("ggplot2")

# create a new lock file for renv
renv::snapshot()
```


## Docker container

Create a Docker container with the `renv` that we made. Inside the Docker container, we are going to use conda / mamba to install the base R and the R `renv` library itself.

Inside the `Dockerfile` we will be including the `renv.lock` file we created here, then using it to install packages into the container.

```bash
# build container
$ docker build -t renv .

# check that it worked
$ docker run --rm -ti renv Rscript -e 'library("ggplot2"); print("loaded")'
[1] "loaded"
```

## Cleaning `renv`

Remove unused packages from your `renv` lock file. This will detect packages that no longer have `library()` calls in your source code in the project.

```R
# demonstrate cleaning the renv; 
# comment out the line that says 'library(ggplot2)' and then run these command
renv::clean()

# update the lock file
renv::snapshot()
```