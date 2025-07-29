FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y ffmpeg wget unzip libatomic1 && \
    pip install vosk

COPY app/vosk-model-small-fr-0.22.zip /app/

RUN mkdir -p models && \
    cd models && \
    if [ ! -f /app/vosk-model-small-fr-0.22.zip ]; then \
        echo "❌ Le fichier /app/vosk-model-small-fr-0.22.zip est introuvable." && \
        echo "➡️  Télécharge-le manuellement depuis : https://alphacephei.com/vosk/models/vosk-model-small-fr-0.22.zip" && \
        exit 1; \
    fi && \
    if [ ! -d vosk-model-small-fr ]; then \
        echo "📦 Décompression du modèle Vosk..." && \
        unzip /app/vosk-model-small-fr-0.22.zip; \
    fi
