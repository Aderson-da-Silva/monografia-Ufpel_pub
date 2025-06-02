# Use a stable Debian base image
FROM debian:bookworm

# Set environment variable for CRAN repository
ENV CRAN_REPO="https://cloud.r-project.org"

# Add Debian sources and install dependencies
RUN echo "deb http://deb.debian.org/debian bookworm main" > /etc/apt/sources.list && \
    echo "deb http://security.debian.org/debian-security bookworm-security main" >> /etc/apt/sources.list && \
    echo "deb http://deb.debian.org/debian bookworm-updates main" >> /etc/apt/sources.list && \
    apt-get update && apt-get install -y \
    software-properties-common \
    libblas-dev \
    liblapack-dev \
    libatlas-base-dev \
    gfortran \
    build-essential \
    zlib1g-dev \
    dirmngr \
    gnupg \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libgit2-dev \
    unzip \
    libfontconfig1-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    wget\
    r-base --no-install-recommends && apt-get clean


# Install R packages
RUN R -e "install.packages( \
                c( \
                  'tidyverse',\
                  'tidyquant',\
                  'readxl',\
                  'tidyfinance',\
                  'GetDFPData2',\
                  'future',\
                  'stringdist',\
                  'httr',\
                  'jsonlite',\
                  'zip',\
                  'readr',\
                  'doParallel',\
                  'rvest'\
                ), repos='${CRAN_REPO}')"


# Set working directory inside container
WORKDIR /usr/src/app

# Copy project files into container
COPY . .

# Default command to start an interactive R session
CMD ["R"]
