FROM rocker/rstudio:4.4.2

COPY bash.sh /home/rstudio/bash.sh

RUN bash /home/rstudio/bash.sh

RUN Rscript -e "install.packages('remotes')" # Double quotes for command itself, single quotes for within command 
RUN Rscript -e "remotes::install_version('renv', version='1.0.11')" # Install renv; since install_version is the same as install.packages; renv starts over or use lock file to instlal everything with renv 
RUN Rscript -e "remotes::install_version('cowsay', version='1.0.0')" # Installs cowsay with specifc version; since this is here, don't need to reactivate renv within R file 

COPY cowsaid.R /home/rstudio/cowsaid.R
# Run the R script as rstudio user; has to be formatted like this to avoid JSONArgsRecommended warning; will run a RStudio instead if commented out
CMD ["Rscript", "/home/rstudio/cowsaid.R"] 