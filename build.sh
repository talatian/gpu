export NVIDIA_VISIBLE_DEVICES=all
export NVIDIA_DRIVER_CAPABILITIES=video,compute,utility
export DEBIAN_FRONTEND=noninteractive

apt update && apt install -y git build-essential yasm cmake libtool libc6 libc6-dev unzip wget libnuma1 libnuma-dev pkg-config

git clone --branch n8.2.15.11 https://git.videolan.org/git/ffmpeg/nv-codec-headers.git && \
    cd nv-codec-headers && \
    make install && \
    cd ..

git clone --branch n5.1.3 https://git.ffmpeg.org/ffmpeg.git ffmpeg/ && cd ffmpeg && \
    ./configure --enable-nonfree --enable-cuda-nvcc --enable-libnpp --extra-cflags=-I/usr/local/cuda/include --extra-ldflags=-L/usr/local/cuda/lib64 --disable-static --enable-shared && \
    make -j 8 && make install
    
    

