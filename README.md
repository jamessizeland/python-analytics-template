# Python Analytics Template

## Quick Start

```bash
source venv.sh
```

## Overview

An opinionated Python data focused project template

## Project Organization

```text
├── README.md          <- The top-level README for developers using this project.
├── data
│   ├── external       <- Data from third party sources.
│   ├── interim        <- Intermediate data that has been transformed.
│   ├── processed      <- The final, canonical data sets for modeling.
│   └── raw            <- The original, immutable data dump.
│
├── docs               <- Additional documentation for this project beyond the top-level README.
│
├── notebooks          <- Jupyter notebooks. Naming convention is a number (for ordering),
│   └── .ipynb            the creator's initials, and a short `-` delimited description, e.g.
│                         `1.0-jqp-initial-data-exploration`.
│
├── reports            <- Generated analysis as HTML, PDF, LaTeX, etc.
│   └── figures        <- Generated graphics and figures to be used in reporting
│
├── pyproject.toml     <- The Python requirements and development experience configuration file
│
├── Cargo.toml         <- The Rust configuration file
│
├── src                <- Source code for use in this project.
│   ├── __init__.py    <- Makes src a Python module
│   │
│   ├── modules        <- Python scripts for this project separated by functional units
│   │   └── .py
│   ├── tests          <- Pytest scripts for this project
│   │   └── .py
│   └── lib.rs         <- Rust code that can be compiled and called from Python with pyo3
│                         and maturin, by running the command 'maturin develop'
│
└── venv.sh            <- Generate a virtual environment and install dependencies
```

## Developer Tools

### [Mypy](https://mypy.readthedocs.io/en/stable/) - a static type checker for Python

Type checkers help ensure that you’re using variables and functions in your code correctly. With mypy, add type hints (PEP 484) to your Python programs, and mypy will warn you when you use those types incorrectly.

Python is a dynamic language, so usually you’ll only see errors in your code when you attempt to run it. Mypy is a static checker, so it finds bugs in your programs without even running them!

### [Pydantic](https://docs.pydantic.dev/) - Data validation and settings management using Python type annotations

Pydantic enforces type hints at runtime, and provides user friendly errors when data is invalid. Define how data should be in pure, canonical Python; validate it with pydantic.

### [Black](https://pypi.org/project/black/) - The Uncompromising Code Formatter

By using Black, you agree to cede control over minutiae of hand-formatting. In return, Black gives you speed, determinism, and freedom from pycodestyle nagging about formatting. You will save time and mental energy for more important matters.

Blackened code looks the same regardless of the project you're reading. Formatting becomes transparent after a while and you can focus on the content instead.

### [Ruff](https://beta.ruff.rs/docs/) - An extremely fast Python linter, written in Rust

Ruff aims to be orders of magnitude faster than alternative tools while integrating more functionality behind a single, common interface.

Ruff can be used to replace Flake8 (plus dozens of plugins), isort, pydocstyle, yesqa, eradicate, pyupgrade, and autoflake, all while executing tens or hundreds of times faster than any individual tool.

### [Poetry](https://python-poetry.org/) - Python Packaging and Dependency Management made easy

Poetry allows you to declare the libraries your project depends on and it will manage (install/update) them for you. Poetry offers a lockfile to ensure repeatable installs, and can build your project for distribution.

### [Rust](https://www.rust-lang.org/) - Blazingly fast code modules

Use [pyo3](https://pyo3.rs/v0.18.2/) to compile custom Rust code with native Python bindings.  Update exported functions from src/lib.rs by running `maturin develop`.


---

## Credit

Project based on the [cookiecutter data science project template](https://drivendata.github.io/cookiecutter-data-science/).
