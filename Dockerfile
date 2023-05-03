FROM willprice/nvidia-ffmpeg

RUN apt update && apt -y install python3-pip
RUN pip3 install jupyter jupyterlab
