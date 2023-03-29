import os


# list files in the data folder on the project root
def list_files():
    return os.listdir(os.path.join(os.path.dirname(__file__), "..", "data"))


def add(a, b) -> int:
    return a + b
