[Welcome to LangChain — 🦜🔗 LangChain 0.0.154](https://python.langchain.com/en/latest/index.html)

# Quickstart

```
$ pip install langchain
$ pip install openai
```

```py
import os
os.environ["OPENAI_API_KEY"] = "..."
from langchain.llms import OpenAI
llm = OpenAI(temperature=0.9)
text = "What would be a good company name for a company that makes colorful socks?"
print(llm(text)) #=> Feetful of Fun
```
