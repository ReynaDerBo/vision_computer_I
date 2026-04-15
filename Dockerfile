FROM jupyter/scipy-notebook:latest

USER root

RUN apt-get update && apt-get install -y \
    ffmpeg \
    libsm6 \
    libxext6 \
    libgl1 \
    && apt-get clean

USER jovyan

# 🔥 CLAVE: borrar conflictos
RUN pip uninstall -y numpy matplotlib opencv-python opencv-python-headless || true

# 🔥 reinstalar TODO consistente
RUN pip install --upgrade pip

RUN pip install \
    "numpy<2.0" \
    matplotlib \
    opencv-python-headless \
    scikit-image \
    imageio \
    tqdm