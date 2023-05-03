FROM nvidia/cuda:11.6.0-devel-ubuntu20.04
ENV NVIDIA_VISIBLE_DEVICES=all
ENV NVIDIA_DRIVER_CAPABILITIES=video,compute,utility
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt -y install python3-pip
RUN pip3 install jupyter jupyterlab


