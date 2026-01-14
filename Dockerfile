FROM ghcr.io/danny-avila/librechat:latest

# Copier le fichier de configuration LibreChat dans l'image
COPY librechat.yaml /app/librechat.yaml

# Définir la variable d'environnement pour le chemin du fichier de configuration
ENV CONFIG_PATH=/app/librechat.yaml
