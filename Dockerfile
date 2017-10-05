# Set base image.
FROM alpine:latest

MAINTAINER Krennic

# Define rancher-compose version
ENV RANCHER_VERSION=v0.4.1

# Install dependencies and rancher-compose
RUN apk add --quiet --no-cache ca-certificates curl unzip && \
	curl -sSL "https://github.com/rancher/cli/releases/download/${RANCHER_VERSION}/rancher-linux-amd64-${RANCHER_VERSION}.tar.gz" | tar -xzp -C /usr/local/bin/ --strip-components=2 && \
	rm -rf /var/cache/*

# Set working directory
WORKDIR /workspace

# Executing defaults
ENTRYPOINT ["rancher"]