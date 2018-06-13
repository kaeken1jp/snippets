# google_cloud_vision_api snippets

https://cloud.google.com/vision/

## pip install

https://google-cloud-python.readthedocs.io/en/latest/vision/index.html

```bash
pip install google-cloud
pip install google-cloud-vision
```

## text detection
```python
from google.cloud import vision
from google.cloud.vision import types

client = vision.ImageAnnotatorClient()
file_name = 'file.jpeg'
with io.open(file_name, 'rb') as image_file:
    content = image_file.read()

image = types.Image(content=content)

response = client.text_detection(image=image)
texts = response.text_annotations
for text in texts:
    text_result = text.description
    print(text_result)
```
