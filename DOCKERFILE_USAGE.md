# Dockerfile Usage Guide

This guide is for the `Dockerfile` in the current directory.  
It builds an image that contains the `Raep_docker` conda environment (Python 3.11).

## 1. Prerequisites

- Docker Desktop is installed and running
- Your terminal is in the project directory (where `Dockerfile` is located)

## 2. Build the image

```powershell
docker build -t raep_docker:py311 .
```

Check that the image exists:

```powershell
docker images | Select-String raep_docker
```

## 3. Run the image

Check Python version inside the image:

```powershell
docker run --rm raep_docker:py311
```

Start an interactive shell in the container:

```powershell
docker run --rm -it raep_docker:py311 /bin/bash
```

## 4. Export the image to a tar file

```powershell
docker save -o raep_docker_py311.tar raep_docker:py311
```

## 5. Import the image from a tar file

```powershell
docker load -i raep_docker_py311.tar
```

Verify after import:

```powershell
docker images | Select-String raep_docker
```

## 6. Troubleshooting

- `cannot connect to the Docker daemon`
  - Make sure Docker Desktop is running
- Image pull fails
  - Check your network or Docker registry mirror settings
- Build cache issues
  - Try `docker system prune -af` and rebuild

