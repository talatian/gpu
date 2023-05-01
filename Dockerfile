FROM willprice/nvidia-ffmpeg
RUN apt update && apt install python3-pip -y
RUN apt install python-is-python3
RUN pip3 install jupyter
RUN pip3 install jupyterlab
