FROM ghcr.io/danny-avila/librechat:latest

COPY librechat.yaml /app/librechat.yaml

ENV CONFIG_PATH=/app/librechat.yaml
ENV APP_TITLE="Chat-gora"
