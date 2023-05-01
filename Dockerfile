FROM willprice/nvidia-ffmpeg
RUN apt install python3-pip -y
RUN pip3 install jupyter
RUN pip3 install jupyterlab
