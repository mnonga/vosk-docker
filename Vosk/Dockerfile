FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y ffmpeg wget unzip libatomic1 && \
    pip install vosk
