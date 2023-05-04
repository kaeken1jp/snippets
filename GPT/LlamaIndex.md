[jerryjliu/llama_index: LlamaIndex (GPT Index) is a project that provides a central interface to connect your LLM's with external data.](https://github.com/jerryjliu/llama_index)

```
pip install llama-index
```

```py
import os
os.environ["OPENAI_API_KEY"] = 'YOUR_OPENAI_API_KEY'

from llama_index import GPTVectorStoreIndex, SimpleDirectoryReader
documents = SimpleDirectoryReader('data').load_data()
index = GPTVectorStoreIndex.from_documents(documents)
```

```
query_engine = index.as_query_engine()
query_engine.query("<question_text>?")
```
```py
import openai
from llama_index import LlamaIndex
from transformers import GPT2Tokenizer, GPT2LMHeadModel

# Set OpenAI API key
openai.api_key = "YOUR_API_KEY"

# Load GPT-3 model and tokenizer
model_name = 'text-davinci-002'
tokenizer = GPT2Tokenizer.from_pretrained(model_name)
model = GPT2LMHeadModel.from_pretrained(model_name)

# Load LlamaIndex model
llama_index = LlamaIndex()

# Example news article to predict stock prices for
article = "Shares of ABC Company soared today after the company reported better-than-expected earnings for the second quarter of 2023."

# Generate text using GPT-3
prompt = f"What will be the impact of this news on the stock price of ABC Company?\n{article}\nPredicted stock price: "
input_ids = tokenizer.encode(prompt, return_tensors='pt')
output = model.generate(input_ids=input_ids, max_length=50, num_return_sequences=1, temperature=0.7)
prediction = tokenizer.decode(output[0], skip_special_tokens=True)

# Use LlamaIndex to get predicted stock price
predicted_price = llama_index.predict_price(prediction)

print(f"Predicted stock price for ABC Company: {predicted_price}")

```
