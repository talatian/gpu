FROM willprice/nvidia-ffmpeg
RUN apt install python3-pip
RUN pip install jupyter
RUN pip install jupyterlab
