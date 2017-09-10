FROM nvidia/cuda:8.0-cudnn5-devel

MAINTAINER Mario Cho <hephaex@gmail.com>

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
ENV PATH /opt/conda/bin:$PATH
ENV PYTHONHASHSEED 2157


# Override Nvidia's default LD paths, since they're misconfigured in the base image.
ENV LD_LIBRARY_PATH /usr/local/cuda-8.0/lib64:$LD_LIBRARY_PATH

WORKDIR /magot

EXPOSE 8000
CMD ["/bin/bash"]

# Install base packages.
RUN apt-get update --fix-missing && apt-get install -y \
    bzip2 \
    ca-certificates \
    gcc \
    git \
    libc-dev \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender1 \
    wget \
    libevent-dev \
    build-essential && \
    rm -rf /var/lib/apt/lists/*

# Use python 3.6

# Copy select files needed for installing requirements.
COPY requirements.txt .
RUN pip install --no-cache-dir -q http://download.pytorch.org/whl/cu80/torch-0.2.0.post3-cp36-cp36m-manylinux1_x86_64.whl

COPY web/ web/
COPY scripts/ scripts/
