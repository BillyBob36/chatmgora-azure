FROM ghcr.io/danny-avila/librechat:latest

# Copier le fichier de configuration LibreChat dans l'image
COPY librechat.yaml /app/librechat.yaml

# Copier le logo personnalisé (favicon et logo)
COPY Icon-Metagora.png /app/client/public/assets/favicon-32x32.png
COPY Icon-Metagora.png /app/client/public/assets/favicon-16x16.png
COPY Icon-Metagora.png /app/client/public/assets/apple-touch-icon-180x180.png
COPY Icon-Metagora.png /app/client/public/images/logo.png

# Définir la variable d'environnement pour le chemin du fichier de configuration
ENV CONFIG_PATH=/app/librechat.yaml
ENV APP_TITLE="Chat-gora"
