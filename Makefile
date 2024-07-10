.ONESHELL:
.RECIPEPREFIX +=
.DEFAULT_GOAL := help

SHELL := /bin/bash
CONDA_ACTIVATE = source $$(conda info --base)/etc/profile.d/conda.sh ; conda activate ; conda activate
CONDA_DEACTIVATE = source $$(conda info --base)/etc/profile.d/conda.sh ; conda deactivate ; conda deactivate
CONDA_ENV_NAME = vllm-sagemaker

help:
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)


configure-precommit: ## Install and configure pre-commit hooks
	pre-commit install -f --config .pre-commit-config.yaml
	pre-commit run --config .pre-commit-config.yaml --all-files

create-env: # Create Conda environment
	conda env update --force --name $(CONDA_ENV_NAME) --file ./$(CONDA_ENV_NAME)_env.yml

create-kernel: # Create Jupyter kernel from Conda environment
	$(CONDA_ACTIVATE) $(CONDA_ENV_NAME)
	python -s -m ipykernel install --user --name $(CONDA_ENV_NAME) --display-name "Python 10 vLLM SageMaker"

remove-kernel: # Remove jupyter kernel
	$(CONDA_ACTIVATE) $(CONDA_ENV_NAME)
	jupyter kernelspec remove -y $(CONDA_ENV_NAME)

remove-env: # Remove environment
	$(CONDA_DEACTIVATE)
	conda uninstall -y --name $(CONDA_ENV_NAME) --all

setup-env: create-env create-kernel ## Setup environment

delete-env: remove-kernel remove-env ## Delete environment

check-code: ## Run code checks
	pre-commit run --config .pre-commit-config.yaml --all-files