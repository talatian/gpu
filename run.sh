xhost + &&
sudo docker run -it --device=/dev/video0:/dev/video0 -v .:/code  -e HTTP_PROXY=$HTTP_PROXY -e HTTPS_PROXY=$HTTPS_PROXY gpu bash 
