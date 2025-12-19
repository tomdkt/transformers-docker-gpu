# Transformers Gemma FastAPI via Docker

A simple FastAPI application that serves the `google/gemma-3-270m` model using Hugging Face's `transformers` library.

### **Run the application**:

1. **Build and run**:
   ```bash
   make build && make run
   ```
   *Note: Ensure `HF_TOKEN` is set in your .env*


## Pycharm FastApi debug run command:
- `--host 0.0.0.0 --port 8000 --reload`

## Requirements

- Python 3.12+
- Docker & Docker Compose
- NVIDIA GPU with [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html) (for GPU acceleration)