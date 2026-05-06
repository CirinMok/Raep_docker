FROM continuumio/miniconda3:latest

# Keep behavior consistent and avoid interactive prompts.
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /workspace

# Recreate the conda environment config from Raep_docker (history export):
# dependencies: python=3.11
RUN conda create -n Raep_docker -c conda-forge python=3.11 -y && \
    conda clean -afy

# Ensure commands run inside the Raep_docker environment by default.
SHELL ["conda", "run", "-n", "Raep_docker", "/bin/bash", "-c"]

# Verify Python version inside container image.
RUN python --version

# Default command
CMD ["python", "--version"]
