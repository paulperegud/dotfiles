FROM ubuntu:wily

RUN apt-get update && apt-get install -y --no-install-recommends \
		ca-certificates \
		curl \
    git \
	&& rm -rf /var/lib/apt/lists/*

RUN adduser --disabled-password --gecos '' pawel

# Nix requires ownership of /nix.
RUN mkdir -m 0755 /nix && chown pawel /nix

# Change docker user to pawel
USER pawel

# Set some environment variables for Docker and Nix
ENV USER pawel

# Change our working directory to $HOME
WORKDIR /home/pawel
