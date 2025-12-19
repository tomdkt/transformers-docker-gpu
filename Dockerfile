# Moving to a newer PyTorch base image
FROM pytorch/pytorch:2.5.1-cuda12.4-cudnn9-runtime

WORKDIR /app

# Explicitly update pip and install latest versions
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir transformers accelerate torch

COPY app.py .

CMD ["python", "app.py"]