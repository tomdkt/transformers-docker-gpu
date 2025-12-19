import torch
from fastapi import FastAPI
from pydantic import BaseModel
from transformers import pipeline

app = FastAPI()

model_id = "google/gemma-3-270m"
device = "cuda" if torch.cuda.is_available() else "cpu"
dtype = torch.bfloat16 if device == "cuda" and torch.cuda.is_bf16_supported() else torch.float32

pipe = pipeline(
    "text-generation",
    model=model_id,
    model_kwargs={"dtype": dtype},
    device=0 if device == "cuda" else -1,
)

class PromptRequest(BaseModel):
    prompt: str
    max_tokens: int = 100
    temperature: float = 0.7

@app.post("/generate")
async def generate_text(request: PromptRequest):
    result = pipe(
        request.prompt,
        max_new_tokens=request.max_tokens,
        do_sample=True,
        temperature=request.temperature,
        top_k=50,
        top_p=0.95
    )
    return {"generated_text": result[0]['generated_text']}