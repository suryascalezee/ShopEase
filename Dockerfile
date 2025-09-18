FROM python:3.10-slim

# Set work directory inside the container
WORKDIR /app

# Copy requirements first
COPY ./app/requirements.txt /app/requirements.txt

# Install dependencies
RUN pip install --no-cache-dir -r /app/requirements.txt

# Copy source code
COPY ./app /app

# Expose FastAPI default port
EXPOSE 8000

# Run the FastAPI server
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
