from fastapi import FastAPI

# Constants
PROJECT_TITLE = "My FastAPI Project"
PROJECT_VERSION = "1.0.0"

# Khởi tạo ứng dụng FastAPI
app = FastAPI(
    title=PROJECT_TITLE,
    version=PROJECT_VERSION,
    docs_url='/api/docs',
    redoc_url='/api/redoc',
    openapi_url='/api/openapi.json',
)

# Route đơn giản hello_world
@app.get("/hello_world")
def hello_world():
    return {"message": "Hello, World 3!"}
