# Use a slim Python base image
FROM python:3.11-slim

WORKDIR /app

# Install runtime deps
COPY Requirements.txt .
RUN pip install --no-cache-dir -r Requirements.txt

# Copy app
COPY . .

EXPOSE 8000
ENV PORT=8000

# Use gunicorn for production-like server
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:8000", "app:app"]
