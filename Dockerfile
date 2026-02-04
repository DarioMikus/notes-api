# 1. Base image (Linux + Python)
FROM python:3.11-slim

# 2. Create app directory inside container
WORKDIR /app

# 3. Copy dependency list
COPY requirements.txt .

# 4. Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy application code
COPY app ./app

# 6. Run the API server
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]