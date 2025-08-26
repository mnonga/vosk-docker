FROM python:3.11-slim

WORKDIR /app

# 1. Install build tools + system deps
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    ffmpeg \
    espeak-ng \
    libsndfile1 \
    curl \
    wget \
    build-essential \
    gcc \
    g++ \
    pkg-config \
    libffi-dev \
    libssl-dev \
    python3-dev \
    rustc \
    cargo && \
    rm -rf /var/lib/apt/lists/*

# 2. Upgrade pip & install TTS
RUN pip install --upgrade pip
#RUN pip install TTS
# Yiu can install TTS in the container to benefit of cache if bad internet connection

# Optionnel : télécharger un modèle pré-entraîné (ex : français)
# Tu peux aussi les charger à la volée via le script Python

# CMD par défaut : on reste en shell
CMD ["/bin/bash"]

# librosa==0.9.2
# pooch==1.6.0
# Successfully installed torch-2.8.0 torchaudio-2.8.0

# tts --text "Hello world"
