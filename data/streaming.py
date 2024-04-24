from fastapi import FastAPI
from starlette.responses import StreamingResponse
import asyncio

app = FastAPI()

async def generate_data():
    words = ['This', ' ', 'is', ' ', 'a', ' ', 'streaming', ' ', 'example', ' ', 'however', ' ','\n', 'it', ' ', 'works', ' ', 'efficiently', ' ', 'if', ' ', 'there', ' ', 'is', ' ', 'a', ' ', 'newline']
    for word in words:
        await asyncio.sleep(1)  # Simulate some async operation, like fetching data from a database
        #yield word.encode()
        yield word

@app.post("/stream")
async def streaming_post():
    return StreamingResponse(generate_data(), media_type="text/plain")

if __name__ == "__main__":
    import uvicorn
    uvicorn.run("test_app:app", host="0.0.0.0", port=8000, reload=True)
