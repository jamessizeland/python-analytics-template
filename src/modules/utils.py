import os
from typing import Union


# list files in the data folder on the project root
def list_files() -> list[str]:
    return os.listdir(os.path.join(os.path.dirname(__file__), "..", "data"))


Numeric = Union[float, int]

# Example code showing error reporting from mypy and ruff
def add(a: Numeric, b: Numeric, c: Numeric, d, e, f, g, h, i, j) -> Numeric:
    """This is a function that adds three numbers together"""
    d = a + "thing"
    return a + b + c
