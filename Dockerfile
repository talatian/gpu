FROM willprice/nvidia-ffmpeg
RUN apt-get update && apt-get install python3-pip -y
RUN echo 'alias python=python3' >> ~/.bashrc
RUN pip3 install jupyter
RUN pip3 install jupyterlab
