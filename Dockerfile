FROM eclipse-temurin:11-jdk

ENV REVIEWDOG_VERSION=v0.14.1

SHELL ["/bin/bash", "-eo", "pipefail", "-c"]

# hadolint ignore=DL4006
RUN apt-get update && apt-get install -y git

# hadolint ignore=DL4006
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
