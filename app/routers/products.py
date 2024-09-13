"""Routers for products."""
from fastapi import APIRouter

router = APIRouter()

@router.get("/products/")
def get_products():
    """Get products."""
    return {"products": "List of products"}
