FROM rocker/rstudio:4.4.2

COPY bash.sh /home/rstudio/bash.sh

RUN bash /home/rstudio/bash.sh

