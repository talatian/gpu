FROM willprice/nvidia-ffmpeg
RUN apt install python3-pip
RUN pip3 install jupyter
RUN pip3 install jupyterlab
