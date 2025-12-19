import torch
from transformers import pipeline

model_id = "google/gemma-3-270m"
device = "cuda" if torch.cuda.is_available() else "cpu"

print(f"Using device: {device}")

pipe = pipeline(
    "text-generation",
    model=model_id,
    device=0 if device == "cuda" else -1,
    dtype=torch.bfloat16 if device == "cuda" else torch.float32
)

prompt = "Write a short poem about artificial intelligence."
result = pipe(prompt, max_new_tokens=50)
print(result[0]['generated_text'])