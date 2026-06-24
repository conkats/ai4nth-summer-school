# Installation

The summer school notebooks are intended to run on standard laptops using a Python/Jupyter environment.

## Conda

```bash
conda env create -f environment/environment.yml
conda activate ai4nth
jupyter lab
```

## pip

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r environment/requirements.txt
jupyter lab
```

## Docker

```bash
docker build -t ai4nth environment
docker run --rm -p 8888:8888 -v "$PWD":/workspace ai4nth
```

Document any session-specific software requirements in the relevant day folder and instructor templates.
