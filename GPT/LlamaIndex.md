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
