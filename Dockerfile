FROM rocker/r-ver:latest

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
        libxml2-dev \
        libssh2-1-dev \
        libssl-dev \
        make \
        && apt-get clean\
        && rm -rf /var/lib/apt/lists/* \
        && install2.r --error \
        --deps TRUE \
        remotes \
        fs \
        tidyr \
        purrr \
        magrittr \
        tibble \
        rlang  \
        && R -e "remotes::install_github('fmichonneau/fiderent')"

COPY compare-folders.R /compare-folders.R
COPY entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]
