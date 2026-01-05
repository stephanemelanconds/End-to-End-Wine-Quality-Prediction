# 1. Use a more modern Python version (3.11 or 3.12 is recommended for JupyterLab 4.x)
FROM python:3.11-slim-bookworm

# 2. Set the working directory
WORKDIR /app

# 3. Copy only requirements first (Optimizes Docker layer caching)
COPY requirements.txt .

# 4. Upgrade pip and install dependencies
# We combine these to keep the image size small
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# 5. Copy the rest of the application
COPY . .

# 6. Final command
CMD ["python3", "app.py"]