FROM willprice/nvidia-ffmpeg
RUN apt-get update && apt-get install python-pip -y
RUN pip install --upgrade pip
RUN pip install jupyter
RUN pip install jupyterlab
