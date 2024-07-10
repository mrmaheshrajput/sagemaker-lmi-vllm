# Deploy LLM with vLLM on SageMaker in 13 lines

This repository contains the code for the Medium article titled [Deploy LLM with vLLM on SageMaker in 13 lines](https://mrmaheshrajput.medium.com).

![Demo](assets/img/streaming_output.gif)

## Repository Contents

- `.flake8`: Configuration file for flake8 used for precommit checks.
- `.pre-commit-config.yaml`: Configuration file for pre-commit hooks.
- `main.ipynb`: Jupyter notebook containing all the code.
- `Makefile`: Makefile with recipes for various tasks:
  - Creating Conda environment.
  - Setting up precommit.
  - Creating IPython kernel for Jupyter notebook.
  - Removing Conda environment.
- `README.md`: This file.
- `vllm-sagemaker_env.yml`: Conda environment file with all dependencies.

## Complete Code for deployment

<script src="https://gist.github.com/mrmaheshrajput/90d4bbc91a04d0768dc517c995b77281.js"></script>
