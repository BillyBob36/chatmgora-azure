FROM ghcr.io/danny-avila/librechat:latest

# Copier le fichier de configuration LibreChat dans l'image
COPY librechat.yaml /app/librechat.yaml

# Copier le logo personnalisé pour le favicon et l'icône
COPY Icon-Metagora.png /app/client/public/assets/favicon.png
COPY Icon-Metagora.png /app/client/public/assets/logo.png

# Définir la variable d'environnement pour le chemin du fichier de configuration
ENV CONFIG_PATH=/app/librechat.yaml
