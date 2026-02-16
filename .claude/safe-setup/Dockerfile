FROM alpine:3.19

RUN apk add --no-cache \
    bash \
    curl \
    git \
    jq \
    python3 \
    py3-pip \
    nodejs \
    npm

# Create non-root user for safety
RUN adduser -D -s /bin/bash olympus

# Working directory = project mount point
WORKDIR /workspace

# Switch to non-root
USER olympus

# Default shell
CMD ["/bin/bash"]
