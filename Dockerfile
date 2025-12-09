# syntax=docker/dockerfile:1
ARG BASE_IMAGE=python:3.11-slim
FROM ${BASE_IMAGE}

LABEL maintainer="Fernando Cremer <cremerfc@gmail.com>"

WORKDIR /app

# Copy requirements first to leverage layer caching
COPY Requirements.txt /app/Requirements.txt

# Upgrade pip and install Python dependencies without cache
RUN python -m pip install --upgrade pip \
    && python -m pip install --no-cache-dir -r /app/Requirements.txt

# Copy app sources
COPY . /app

ENV PORT=5000
EXPOSE 5000

ENTRYPOINT ["python3"]
CMD ["app/app.py"]
