# Moving to a newer PyTorch base image
FROM pytorch/pytorch:2.5.1-cuda12.4-cudnn9-runtime

WORKDIR /app

# uv install
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/
COPY pyproject.toml .
COPY uv.lock .
# Explicitly update pip and install latest versions
RUN pip install --no-cache-dir --upgrade pip
RUN uv pip install --system --no-cache fastapi uvicorn transformers accelerate torch

COPY app.py .

EXPOSE 8000
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]