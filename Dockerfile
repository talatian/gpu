FROM willprice/nvidia-ffmpeg

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A4B469963BF863CC


RUN apt update && apt -y install python3-pip
RUN pip3 install jupyter jupyterlab
