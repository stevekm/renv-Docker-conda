# https://rstudio.github.io/renv/articles/docker.html
# FROM continuumio/miniconda3:23.5.2-0
FROM condaforge/mambaforge:23.3.1-1

RUN mamba install -y -c conda-forge r-base=4.3.1 r-renv=1.0.3

# add the renv files and install all the R packages
COPY renv.lock /renv.lock
ENV RENV_PATHS_LIBRARY /renv/library
RUN Rscript -e "renv::restore()"

COPY run.R /run.R

RUN Rscript -e "library('ggplot2')"