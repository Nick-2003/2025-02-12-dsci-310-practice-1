# Tutorial 5 Step 3
FROM rocker/rstudio:4.4.2

# Tutorial 5 Step 4
COPY bash.sh /home/rstudio/bash.sh

# Tutorial 5 Step 5
RUN bash /home/rstudio/bash.sh

# Assignment 3

## Option 1: Install the packages directly with remotes package; remotes package used to get specific versions of packages
RUN Rscript -e "install.packages('remotes')" # Double quotes for command itself, single quotes for within command 
RUN Rscript -e "remotes::install_version('renv', version='1.0.11')" # Install renv; since install_version is the same as install.packages; renv starts over or use lock file to instlal everything with renv 
RUN Rscript -e "remotes::install_version('cowsay', version='1.0.0')" # Installs cowsay with specifc version; since this is here, don't need to reactivate renv within R file 
RUN Rscript -e "remotes::install_version('rmarkdown', version='2.29', repos='https://cloud.r-project.org')"

COPY cowsaid.R /home/rstudio/cowsaid.R
COPY sampledoc.qmd /home/rstudio/sampledoc.qmd

## Option 2: Run the R script as rstudio user; has to be formatted like this to avoid JSONArgsRecommended warning; will run a RStudio instead if commented out; only 1 CMD instruction
# CMD ["Rscript", "/home/rstudio/cowsaid.R"] 

# Start RStudio Server (this keeps the container running)
CMD ["/init"]