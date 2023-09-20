from fastapi import FastAPI,UploadFile, File
import torch
from PIL import Image
import io

app = FastAPI()

model = torch.hub.load('ultralytics/yolov5', 'custom', path='lib/custom_model.pt')
model.eval()

@app.post("/predict/")
async def predict(file: UploadFile = File(...)):
    image_data = await file.read()
    image = Image.open(io.BytesIO(image_data))
    
    results = model(image)
    xyxy = results.pandas().xyxy[0].to_dict(orient="records")
    xywhn = results.pandas().xywhn[0].to_dict(orient="records")
    return {"xyxy": xyxy, "xywhn": xywhn}
