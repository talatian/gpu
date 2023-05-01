FROM nvidia/cuda:11.6.0-base-ubuntu20.04
RUN apt update && apt install -y ffmpeg
RUN mkdir /ffmpeg



RUN apt-get update && apt-get install python3-pip -y
RUN pip3 install jupyter
RUN pip3 install jupyterlab

WORKDIR /workspace
ENTRYPOINT ["/usr/bin/ffmpeg"]
CMD ["-h"]
