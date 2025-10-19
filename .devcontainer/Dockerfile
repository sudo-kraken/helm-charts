FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

ENV DEBIAN_FRONTEND=noninteractive

ARG COSIGN_VERSION=3.0.1

# Install basic packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    bash curl ca-certificates git jq \
  && rm -rf /var/lib/apt/lists/*

# Install cosign
RUN set -eux; \
    arch="$(uname -m)"; \
    case "$arch" in \
        x86_64) a=amd64 ;; \
        aarch64) a=arm64 ;; \
        *) a=amd64 ;; \
    esac; \
    curl -fsSL --retry 3 -o /usr/local/bin/cosign "https://github.com/sigstore/cosign/releases/download/v${COSIGN_VERSION}/cosign-linux-${a}"; \
    chmod +x /usr/local/bin/cosign

# Set KUBECONFIG in bashrc
RUN echo 'export KUBECONFIG=$(for YAML in $(find ${HOME}/.kube -maxdepth 1 -type f -name '\''*'\'' 2>/dev/null) ; do echo -n ":${YAML}"; done)' >> /etc/bash.bashrc

ENV EDITOR=code
