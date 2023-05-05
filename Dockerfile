FROM nvidia/cuda:10.2-devel-ubuntu18.04
ENV NVIDIA_VISIBLE_DEVICES=all
ENV NVIDIA_DRIVER_CAPABILITIES=video,compute,utility
ENV LD_LIBRARY_PATH=/usr/local/lib:/usr/local/lib64/:/usr/local/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt -y install python3-pip 
RUN apt -y install python3.10

RUN python3.10 --version
RUN python3 --version

RUN ln -s /usr/bin/python3 /usr/bin/python & \
    ln -s /usr/bin/pip3 /usr/bin/pip
    
RUN python --version

RUN pip3 install jupyter jupyterlab

RUN apt update && apt install -y git build-essential yasm cmake libtool libc6 libc6-dev unzip wget libnuma1 libnuma-dev pkg-config

RUN git clone --branch n8.2.15.11 https://git.videolan.org/git/ffmpeg/nv-codec-headers.git && \
    cd nv-codec-headers && \
    make install && \
    cd ..

RUN git clone --branch n5.1.3 https://git.ffmpeg.org/ffmpeg.git ffmpeg/ && cd ffmpeg && \
    ./configure --enable-nonfree --enable-cuda-nvcc --enable-libnpp --extra-cflags=-I/usr/local/cuda/include --extra-ldflags=-L/usr/local/cuda/lib64 --disable-static --enable-shared && \
    make -j 8 && make install
