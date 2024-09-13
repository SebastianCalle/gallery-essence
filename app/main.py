"""Main to manage the application."""
from fastapi import FastAPI
from .routers import products

app = FastAPI()

app.include_router(products.router)


@app.get("/")
def read_root():
    """Fake endpoint."""
    return {"message": "Welcome to Perfume Shop Management!"}
