FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl ca-certificates bash tini \
  && rm -rf /var/lib/apt/lists/*

# Install sshx
RUN curl -sSf https://sshx.io/get | sh

WORKDIR /root

ENTRYPOINT ["/usr/bin/tini","--"]
CMD ["bash","-lc","sshx"]
