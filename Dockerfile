FROM jwilder/nginx-proxy:1.0.1

LABEL maintainer "Dschinghis Kahn"

RUN \
  apt-get update && \
  apt-get install -y procps && \
  rm -rf /var/lib/apt/lists/*

HEALTHCHECK CMD wget --output-document=/dev/null localhost:80 2>&1 | grep connected && wget --output-document=/dev/null localhost:443 2>&1 | grep connected || exit 1
