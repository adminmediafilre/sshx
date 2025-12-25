FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl ca-certificates bash tini \
  && rm -rf /var/lib/apt/lists/*

# Install sshx
RUN curl -sSf https://sshx.io/get | sh

# (Opsional tapi bagus) jalan sebagai user non-root
RUN useradd -m -u 10001 app
USER app
WORKDIR /home/app

ENTRYPOINT ["/usr/bin/tini","--"]
CMD ["bash","-lc","sshx"]
